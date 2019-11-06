class Product < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :condition
    belongs_to :category
    has_one_attached :picture

    #   Scope methods for search
    scope :search, -> (search) { where("name like ?", "%#{search}%") }
    scope :condition_id, -> (condition_id) { where condition_id: condition_id }
    scope :category_id, -> (category_id) { where category_id: category_id}
end
