class CreateStands < ActiveRecord::Migration[5.2]
  def change
    create_table :stands do |t|
      t.string :name
      t.boolean :open
      t.integer :review_rating

      t.timestamps
    end
  end
end
