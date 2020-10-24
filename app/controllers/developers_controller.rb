class DevelopersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    req_body = params['Body'].downcase
    if (req_body == 'affirm') || (req_body == 'start')
      create
    elsif req_body == 'stop'
      delete
    end
  end

  def create
    @dev = Developer.create!(phone_number: params[:From])
    uuid = @dev.uuid
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
      r.message body: "Hi! You registered to receive developer affirmations. Confirm your registration here: #{preconfirm_url(uuid)} . If you don't confirm, your number will be deleted from the database in 2 days."
    end

    render xml: twiml.to_xml
  end

  def delete
    @dev = Developer.find_by_phone_number(params[:From])
    @dev.delete
  end

  def preconfirm
    confirm
  end

  private
  def confirm
    @dev = Developer.find_by_uuid(params[:developer_uuid])
    @dev.update!(confirmed: true)
    render plain: 'Your number has been confirmed!'
  end
end
