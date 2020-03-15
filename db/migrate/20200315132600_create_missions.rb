class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :item
      t.text :duedate

      t.timestamps
    end
  end
end
