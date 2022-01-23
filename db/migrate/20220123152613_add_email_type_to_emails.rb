class AddEmailTypeToEmails < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :email_type, :string
  end
end
