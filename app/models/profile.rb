class Profile < ApplicationRecord
  has_many :users
  belongs_to :attendees
  validates :name, presence: true, uniqueness: true
  attachment :image
end
