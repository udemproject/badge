class Location < ApplicationRecord
  has_many :events
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true
end
