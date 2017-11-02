class Badge < ApplicationRecord
  belongs_to :attendee, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
