class Notification < ApplicationRecord
  has_many :badges
  enum weekday: [:monday, :tuestay, :wensday, :thursday, :friday, :saturday, :sunday]
  enum message: [:inactivo, :color_rojo, :color_verde, :mensaje_cuatro, :friday, :saturday, :sunday]
end
