class Notification < ApplicationRecord
  belongs_to :badge, dependent: :destroy
  attr_accessor :team_id
  attr_accessor :all
  enum weekday: [:monday, :tuestay, :wensday, :thursday, :friday, :saturday, :sunday]
  enum message_sent: [:inactivo, :color_rojo, :color_verde, :mensaje_cuatro]

  def message_int
    return self.read_attribute_before_type_cast(:message_sent)
  end
end
