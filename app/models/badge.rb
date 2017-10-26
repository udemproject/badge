class Badge < ApplicationRecord
  belongs_to :attendee, dependent: :destroy
  enum message: [:inactivo, :color_rojo, :color_verde, :mensaje_cuatro, :friday, :saturday, :sunday]
end
