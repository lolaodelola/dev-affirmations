class SendAffirmationJob < ApplicationJob
  queue_as :default

  def deliver(dev, affirmation)
    Rails.env != 'test' ? send_prod(dev, affirmation) : send_test(dev, affirmation)
  end
  handle_asynchronously :deliver

  def send_prod(dev, affirmation)
    AffirmationText.new.message(dev.phone_number, affirmation.affirmation)
  end

  def send_test(dev, affirmation)
    MockAffirmationText.new.message(dev.phone_number, affirmation.affirmation)
  end
end

class MockAffirmationText
  def message(dev_phone_number, affirmation)
    "#{affirmation} was sent to #{dev_phone_number}"
  end
end