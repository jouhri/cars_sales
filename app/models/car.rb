class Car < ActiveRecord::Base
  validates :name, :price, :brand, presence: true
end
