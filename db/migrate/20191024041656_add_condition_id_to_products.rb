class AddConditionIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :condition, foreign_key: true
  end
end
