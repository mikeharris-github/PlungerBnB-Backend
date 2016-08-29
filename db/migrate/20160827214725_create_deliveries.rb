class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.integer :requestor_id
      t.integer :deliverer_id
      t.boolean :delivered
    end
  end
end
