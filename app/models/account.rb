class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  
  validates_presence_of :name
end
