class OrderItem < ApplicationRecord
  has_many :customer, dependent: :destroy
end
