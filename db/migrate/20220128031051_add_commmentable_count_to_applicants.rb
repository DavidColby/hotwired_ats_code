class AddCommmentableCountToApplicants < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :commentable_count, :integer
  end
end
