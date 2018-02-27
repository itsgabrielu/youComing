class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date_start
      t.datetime :date_end
      t.text :description

      t.timestamps
    end
  end
end
