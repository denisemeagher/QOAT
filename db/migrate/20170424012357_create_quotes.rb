class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.text :body,       null: false
      t.string :category
      t.string :slug,     null: false
      t.text :tags,       array: true, default: [] 
      t.text :terms
      t.string :source

      t.timestamps
    end
  end
end
