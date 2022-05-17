class CreateFarmersMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :farmers_markets do |t|
      t.string :name
      t.string :city
      t.boolean :open
      t.integer :num_stands

      t.timestamps
    end
  end
end
