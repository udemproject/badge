class Invitation < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :event, dependent: :destroy

  before_create :generate_token

  enum status: [:pending, :accepted, :rejected]

  private

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
