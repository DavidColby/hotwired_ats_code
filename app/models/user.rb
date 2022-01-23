class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :account
  belongs_to :invited_by, required: false, class_name: 'User'
  accepts_nested_attributes_for :account

  has_many :emails, dependent: :destroy
  has_many :invited_users, class_name: 'User', foreign_key: 'invited_by_id', dependent: :nullify, inverse_of: :invited_by
  has_many :notifications, dependent: :destroy


  after_create_commit :generate_alias

  def generate_alias
    email_alias = "#{email.split('@')[0]}-#{id[0...4]}"
    update_column(:email_alias, email_alias)
  end

  def reset_invite!(inviting_user)
    update(invited_at: Time.current, invited_by: inviting_user)
  end

  def name
    [first_name, last_name].join(' ').presence || '(Not set)'
  end
end
