class Profile < ApplicationRecord
  has_many :users
  attachment :image
end
