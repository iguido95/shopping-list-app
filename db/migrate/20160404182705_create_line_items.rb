class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :comment
      t.integer :amount
      # De LineItems worden verwijderd bij het verwijderen van een List
      t.references :list, index: true, foreign_key: { on_delete: :cascade }
      # Eerst alle line_items verwijderen voor de Item verwijderd mag worden
      t.references :item, index: true, foreign_key: { on_delete: :restrict }

      t.timestamps null: false
    end
  end
end
