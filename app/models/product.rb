class Product < ApplicationRecord
    belongs_to :user
    has_one :condition
    has_one :category
end
