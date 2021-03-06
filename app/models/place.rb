class Place < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :comments
  
  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true, length: { minimum: 4 }
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 500 }
end
