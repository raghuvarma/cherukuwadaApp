class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :event_on
      t.boolean :is_repeated

      t.timestamps null: false
    end
  end
end
