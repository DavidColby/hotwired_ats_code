class Email < ApplicationRecord
  has_rich_text :body

  belongs_to :applicant
  belongs_to :user

  validates_presence_of :subject

  after_create_commit :send_email, if: :outbound?

  enum email_type: {
    outbound: 'outbound',
    inbound: 'inbound'
  }

  after_create_commit :broadcast_to_applicant

  def broadcast_to_applicant
    broadcast_prepend_later_to(
      applicant,
      :emails,
      target: 'emails-list',
      partial: 'emails/list_item',
      locals: {
        email: self,
        applicant: applicant
      }
    )
  end

  def send_email
    ApplicantMailer.contact(email: self).deliver_later
  end

  def build_reply(email_id)
    replying_to = Email.find(email_id)
    original_body = replying_to.body.body.to_html
  
    email = Email.new(applicant_id: replying_to.applicant_id)
    email.subject = "re: #{replying_to.subject}"
    reply_intro = <<-HTML
      
      On #{replying_to.created_at.to_date} #{email.applicant.name} wrote:
      
    HTML
    email.body = original_body.prepend(reply_intro)
    email
  end
end
