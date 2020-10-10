class ConfirmationText
  include Routeable
  def initialize(client: nil)
    @client = client || Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"])
  end

  def message(developer)
    developer_path = Rails.application.routes.url_helpers.developer_confirm_url(developer.uuid)
    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: developer.phone_number,
      body: "Hi! You registred to recive developer affirmations. Confirm your registration here: #{developer_path}"
    )
  end
end
