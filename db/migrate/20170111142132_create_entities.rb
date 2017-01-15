class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :title
      t.string :text
      t.string :url_path
      t.integer :order_number
      t.references :entity
    end
  end
end
