class Product < ApplicationRecord
    belongs_to :user, optional: true
    has_one :condition
    has_one :category
    has_one_attached :picture
end
