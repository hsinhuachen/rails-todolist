class AddColumnToMission2 < ActiveRecord::Migration[6.0]
  def change
    add_column :missions, :sorting, :string
    add_column :missions, :status, :string
  end
end
