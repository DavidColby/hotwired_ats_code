class AddEmailAliasToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_alias, :string
    add_index :users, :email_alias
  end
end
