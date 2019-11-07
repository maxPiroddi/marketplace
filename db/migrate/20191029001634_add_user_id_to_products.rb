# frozen_string_literal: true

class AddUserIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :user_id, :integer
  end
end
