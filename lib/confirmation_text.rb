class ConfirmationText
  def initialize(client: nil)
    @client = client || Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"])
  end

  def success_message(developer)
    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: developer.phone_number,
      body: "Your number has been successfully confirmed!"
    )
  end
end
