class SendAffirmationJob < ApplicationJob
  queue_as :default

  def deliver(dev, affirmation)
    AffirmationText.new.message(dev.phone_number, affirmation.affirmation)
    SentAffirmation.create!(developer_id: dev.id, affirmation_id: affirmation.id, sent_at: DateTime.now)
  end
  handle_asynchronously :deliver
end
