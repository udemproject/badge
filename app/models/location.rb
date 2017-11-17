class Location < ApplicationRecord
  has_many :events, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true
  VALID_MAPS =/^http\:\/\/|https\:\/\/|www\.google$/
  validate :validate_link



  def validate_link
    if gmaps_url.present?
      unless gmaps_url.include? "www.google.com.mx/maps"
        errors.add(:gmaps_url, "Enter a valid google maps")
      end
    end
  end

end
