class Applicant < ApplicationRecord
  belongs_to :job

  enum stage: {
    application: 'application',
    interview: 'interview',
    offer: 'offer',
    hired: 'hire'
  }

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  validates_presence_of :first_name, :last_name, :email

  has_one_attached :resume

  def name
    [first_name, last_name].join(' ')
  end
end
