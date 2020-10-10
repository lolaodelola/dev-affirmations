class AffirmationText
  def initialize(client: nil)
    @client = client || Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def message(dev_phone_number, affirmation)
    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: dev_phone_number,
      body: affirmation
    )
  end
end
