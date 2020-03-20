class Shop < ApplicationRecord
    has_many :requests
    belongs_to :user
    has_one_attached :productImage
    
    validates :product_name, presence: true
end
