class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    Notification.find_each("time <= ?", Time.now) do |job|
        
    end
  end
end
