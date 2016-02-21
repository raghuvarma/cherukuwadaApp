class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :created_by
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_index :comments, :name
  end
end
