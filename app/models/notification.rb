class Notification < ApplicationRecord
  belongs_to :badges
  enum weekday: [:monday, :tuestay, :wensday, :thursday, :friday, :saturday, :sunday]
  enum message_sent: [:inactivo, :color_rojo, :color_verde, :mensaje_cuatro]
end
