class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :applicants, through: :jobs, enable_updates: { on: :create }

  validates_presence_of :name
end
