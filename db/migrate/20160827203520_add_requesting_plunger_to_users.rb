class AddRequestingPlungerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :requesting_plunger, :boolean, default: false
  end
end
