class AddColumnToMission < ActiveRecord::Migration[6.0]
  def change
    add_column :missions, :user_id, :integer
  end
end
