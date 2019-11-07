# frozen_string_literal: true

class AddPostcodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postcode, :integer
  end
end
