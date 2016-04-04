class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.string :description
      t.string :barcode, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
