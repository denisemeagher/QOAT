class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.integer :quote_id,    null: false
      t.string :name,		  null: false			
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
