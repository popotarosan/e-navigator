class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users,:name,:string
    add_column :users,:birthday,:datetime
    add_column :users,:gender,:integer,default:0
    add_column :users,:school_name,:string
  end
end
