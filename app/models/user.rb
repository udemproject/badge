class User < ApplicationRecord
  belongs_to :profile, required: false
  has_many :invitations
  has_many :accepted_invitations, -> { where(status: :accepted) }, class_name: 'Invitation'
  has_many :attendees

  has_many :reviewees, class_name: 'Review', foreign_key: 'reviewee_id'
  has_many :reviewers, class_name: 'Review', foreign_key: 'reviewer_id'
  has_many :questions, through: :reviewees

  enum shirt_size: [:s, :m, :l, :xl]
  enum role: [:user, :admin]

  attachment :avatar, type: :image
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  def overall_rank
    reviewees.average(:stars)
  end

  def question_ranks
    ranks = []
    questions.each do |q|
      ranks << { stars: Review.where(reviewee: self, question: q).average(:stars), question: q.question }
    end
    ranks
  end

  def picture_url
    return avatar_url unless avatar_id.blank?
    return image_url unless image_url.blank?
    'https://placehold.it/500x500?text=Profile+Picture'
  end

  def pending_invitations?
    invitations.where(status: :pending).count > 0
  end

  def self.from_omniauth(auth)
    existing_user = User.find_by(email: auth.info.email)
    current_event = Event.last # TODO DELETE
    if existing_user
      Invitation.find_or_create_by(event: current_event, user: existing_user)
      return existing_user
    end
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.image_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.invitations << Invitation.create(event: current_event)
      user.save!
    end
  end
end
