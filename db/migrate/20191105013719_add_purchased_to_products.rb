class AddPurchasedToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :purchased, :boolean
  end
end
