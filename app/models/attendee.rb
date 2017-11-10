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
    return self.user.name
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
  private

  def notify_create
    ActionCable.server.broadcast "draft", {action: "create_attendee", user_id: user.id, picture_url: user.picture_url, name: user.name}
  end

  def notify_update
    ActionCable.server.broadcast "draft", {action: "update_draft", user_id: user.id, team_id: team&.id}
    ActionCable.server.broadcast "draft", {action: "update_turn"}
  end
end
