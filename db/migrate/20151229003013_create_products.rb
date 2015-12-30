class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :title, :category
      t.text     :body, :location
      t.integer  :price
      t.integer  :quantity
      t.datetime :expiration_date

      t.timestamps null: false
    end
  end
end
