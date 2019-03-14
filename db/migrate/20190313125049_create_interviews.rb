class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.integer :user_id
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
