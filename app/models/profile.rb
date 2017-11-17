class Profile < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :attendees , dependent: :destroy
  validates :name, presence: true, uniqueness: true
  attachment :image
end
