class AddInviteFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :invite_token, :string
    add_index :users, :invite_token
    add_column :users, :invited_at, :datetime
    add_column :users, :accepted_invite_at, :datetime
    add_reference :users, :invited_by, type: :uuid, foreign_key: { to_table: :users }
  end
end
