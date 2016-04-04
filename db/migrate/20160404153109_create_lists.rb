class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      # Alle Lists worden hierdoor verwijderd bij verwijdering van de User; op database niveau.
      t.references :user, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
