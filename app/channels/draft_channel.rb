class DraftChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'draft'
  end

  def unsubscribed
    # clean algo
  end
end
