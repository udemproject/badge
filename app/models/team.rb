class Team < ApplicationRecord
  belongs_to :event, dependent: :destroy
  has_many :attendees, -> { joins(:event) }
  has_many :profiles, through: :attendees
  has_many :users, through: :attendees

  def available_profile?(profile)
    profiles[profile].present? && profiles[profile] > 0
  end

  def profiles_all
    attendees = self.attendees
    profiles_ids =[]
    profile = []
    attendees.each do |att|
      unless att.profile_id.nil?
        profiles_ids.push(att.profile_id)
      end
    end
    profiles_ids.each do |profil|
      profile.push(Profile.find(profil).name)
    end
    return profile
  end


  def substract_profile(profile)
    profiles[profile] -= 1
  end

  def missing_profiles
    profiles.flat_map { |k, v| ("#{k}," * v).split(',') }
  end
end
