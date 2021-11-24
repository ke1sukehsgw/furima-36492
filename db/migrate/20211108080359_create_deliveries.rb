class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code,       null: false
      t.integer :shipping_area_id, null: false
      t.string :municipalities,    null: false
      t.string :house_number,      null: false
      t.string :building_name
      t.string :telephone_number,  null: false
      t.references :buy,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
