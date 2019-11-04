class Product < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :condition
    belongs_to :category
    has_one_attached :picture
end
