class Notification < ApplicationRecord
  belongs_to :badge, dependent: :destroy
  attr_accessor :team_id
  attr_accessor :all
  attr_accessor :event_id
  enum weekday: [:monday, :tuestay, :wensday, :thursday, :friday, :saturday, :sunday]
  enum message_sent: [:inactivo, :color_rojo, :color_verde, :mensaje_cuatro, :mensaje_aqua, :mensaje_morado, :mensaje_amarillo]

  def message_int
    return self.read_attribute_before_type_cast(:message_sent)
  end
end
