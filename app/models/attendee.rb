class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :team, required: false
  after_update :notify_update
  after_create :notify_create
  validates :event, presence: true
  validate :validate_presence

  def names
    return self.user.name
  end

  def validate_presence
    users=  self.event.users.all
    if users.include? self.user
      errors.add(:user, "user already exist in this event")
    end
  end

  private

  def notify_create
    ActionCable.server.broadcast "draft", {action: "create_attendee", user_id: user.id, picture_url: user.picture_url, name: user.name}
  end

  def notify_update
    ActionCable.server.broadcast "draft", {action: "update_draft", user_id: user.id, team_id: team&.id}
    ActionCable.server.broadcast "draft", {action: "update_turn"}
  end
end
