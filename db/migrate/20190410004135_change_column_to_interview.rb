class ChangeColumnToInterview < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :status, :integer,default: 3
  end
end
