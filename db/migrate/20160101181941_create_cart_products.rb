class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.shopping_cart_item_fields
      t.integer :user_id           # Holds the owner id, for polymorphism
      t.integer :user_type         # Holds the type of the owner, for polymorphism
      t.integer :quantity          # Holds the quantity of the object
      t.integer :product_id        # Holds the object id
      t.string  :product_type      # Holds the type of the object, for polymorphism
      t.float   :price

      t.timestamps null: false
    end
  end
end
