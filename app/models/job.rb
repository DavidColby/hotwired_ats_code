class Job < ApplicationRecord
  belongs_to :account
  has_many :applicants, dependent: :destroy

  validates_presence_of :title, :status, :job_type, :location

  enum status: {
    draft: 'draft',
    open: 'open',
    closed: 'closed'
  }

  enum job_type: {
    full_time: 'full_time',
    part_time: 'part_time'
  }

  has_rich_text :description
end
