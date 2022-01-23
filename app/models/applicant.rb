class Applicant < ApplicationRecord
  include PgSearch::Model
  FILTER_PARAMS = %i[query job sort].freeze

  belongs_to :job

  has_one_attached :resume
  has_many :emails, dependent: :destroy

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

  pg_search_scope :text_search,
    against: %i[first_name last_name email],
    using: {
      tsearch: {
        any_word: true,
        prefix: true
      }
    }

  scope :for_account, ->(account_id) { where(jobs: { account_id: account_id }) }
  scope :for_job, ->(job_id) { job_id.present? ? where(job_id: job_id) : all }
  scope :search, ->(query) { query.present? ? text_search(query) : all }
  scope :sorted, ->(selection) { selection.present? ? apply_sort(selection) : all }

  def self.filter(filters)
    includes(:job)
      .search(filters['query'])
      .for_job(filters['job'])
      .sorted(filters['sort'])
  end

  def self.apply_sort(selection)
    sort, direction = selection.split('-')
    order("applicants.#{sort} #{direction}")
  end

  def name
    [first_name, last_name].join(' ')
  end
end
