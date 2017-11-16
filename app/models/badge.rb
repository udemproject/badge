class Badge < ApplicationRecord
  belongs_to :attendee, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def names
    name = self.attendee.user.name
    email = self.attendee.user.email
    return "name: "+ name
  end
end
