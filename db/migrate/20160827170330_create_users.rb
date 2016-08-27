class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :uniquedevice_token
      t.st_point :location, geographic: true, null: false
    end
    change_table :users do |t|
      t.index :location, using: :gist
    end
  end
end
