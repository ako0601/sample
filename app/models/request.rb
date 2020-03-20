class Request < ApplicationRecord
    belongs_to :shop
    
    validates :email, presence: true
    validates :name, presence: true
end
