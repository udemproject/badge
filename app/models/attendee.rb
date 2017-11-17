class Attendee < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :event , dependent: :destroy
  belongs_to :team, required: false
  has_one :badge
  after_update :notify_update
  after_create :notify_create
  validates :event, presence: true
  validate :validate_presence, on: [:new, :create]
  validate :validate_presence_update, on: [:edit, :update]

  def names
    name = self.user.name
    email = self.user.email
    return "name: "+ name + " email: "+email
  end
  def badge_present
    if self.badge
      return true
    else
      return false
    end
  end

  def validate_presence
    users=  self.event.users.all
    if users.include? self.user
        errors.add(:user, "user already exist in this event")
    end
  end

  def validate_presence_update
    users=  self.event.users.all
    if users.include? self.user
      compare = self.event.attendees.all
      unless compare.include? self
        errors.add(:user, "already exist in this event")
      end
    end
  end

  def find_badges(attendees)
    badges = []
    attendees.each do |attendee|
      badges << attendee.badge unless attendee.badge.blank?
    end
    return badges
  end
  private

  # def notify_create
  #   ActionCable.server.broadcast "draft", {action: "create_attendee", user_id: user.id, picture_url: user.picture_url, name: user.name}
  # end
  #
  # def notify_update
  #   ActionCable.server.broadcast "draft", {action: "update_draft", user_id: user.id, team_id: team&.id}
  #   ActionCable.server.broadcast "draft", {action: "update_turn"}
  # end
end
