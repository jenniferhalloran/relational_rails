class AddFarmersMarketToStands < ActiveRecord::Migration[5.2]
  def change
    add_reference :stands, :farmers_market, foreign_key: true
  end
end
