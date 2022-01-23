class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :jobs, dependent: :destroy

  validates_presence_of :name
end
