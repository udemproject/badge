class Badge < ApplicationRecord
  belongs_to :user,  dependent: :destroy
end
