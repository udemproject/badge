class Team < ApplicationRecord
  belongs_to :event
  has_many :attendees, -> { joins(:event) }
  has_many :users, through: :attendees

  def available_profile?(profile)
    profiles[profile].present? && profiles[profile] > 0
  end

  def substract_profile(profile)
    profiles[profile] -= 1
  end

  def missing_profiles
    profiles.flat_map { |k, v| ("#{k}," * v).split(',') }
  end
end
