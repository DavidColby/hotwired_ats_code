class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :account
  accepts_nested_attributes_for :account

  has_many :emails, dependent: :destroy
  has_many :notifications, dependent: :destroy

  after_create_commit :generate_alias

  def generate_alias
    email_alias = "#{email.split('@')[0]}-#{id[0...4]}"
    update_column(:email_alias, email_alias)
  end
end
