class SendAffirmationJob < ApplicationJob
  queue_as :default

  def deliver(dev, affirmation)
    if Rails.env != 'test'
      AffirmationText.new.message(dev.phone_number, affirmation.affirmation)
    else
      MockAffirmationText.new.message(dev.phone_number, affirmation.affirmation)
    end
    SentAffirmation.create!(developer_id: dev.id, affirmation_id: affirmation.id, sent_at: DateTime.now)
  end
  handle_asynchronously :deliver
end

class MockAffirmationText
  def message(dev_phone_number, affirmation)
    "#{affirmation} was sent to #{dev_phone_number}"
  end
end