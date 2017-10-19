class Notification < ApplicationRecord

  enum weekday: [:monday, :tuestay, :wensday, :thursday, :friday, :saturday, :sunday]
end
