class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :title
      t.string :status
      t.string :job_type
      t.string :location
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :jobs, :status
    add_index :jobs, :job_type
  end
end
