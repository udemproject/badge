class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :starts_at, presence: true
  validates :finishes_at, presence: true
  validate :expiration_date_cannot_be_in_the_past
  before_create :generate_slug
  belongs_to :location
  has_many :invitations, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :users, through: :attendees
  has_many :invited_users, through: :invitations, class_name: 'User', source: :user
  has_many :reviews, -> { where.not(answer: nil) }
  attachment :image
  attachment :agenda_image

  after_update :send_review_mail, if: :review?

  def to_param
    slug
  end

  def self.find(input)
    if input.is_a?(Integer)
      super
    else
      find_by(slug: input)
    end
  end

  def expiration_date_cannot_be_in_the_past
    if starts_at.present? && starts_at < Date.today || starts_at > finishes_at
      errors.add(:starts_at, "can't be save the date")
    end
  end

  private

  def send_review_mail
    attendees.each do |attendee|
      ReviewMailer.review_invite(attendee).deliver_later
    end
  end

  def generate_slug
    self.slug = name.parameterize
  end
end
