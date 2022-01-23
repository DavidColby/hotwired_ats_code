class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails, id: :uuid do |t|
      t.references :applicant, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.text :subject
      t.datetime :sent_at

      t.timestamps
    end
  end
end
