class SendAffirmationJob < ApplicationJob
  queue_as :default

  def deliver(dev_number, affirmation)
    AffirmationText.new.message(dev_number, affirmation)
  end
  handle_asynchronously :deliver
end
