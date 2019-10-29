class Product < ApplicationRecord
    belongs_to :user, optional: true
    has_one :condition
    has_one :category
end
