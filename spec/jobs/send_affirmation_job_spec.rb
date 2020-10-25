require 'rails_helper'

RSpec.describe SendAffirmationJob, type: :job do

  before :each do
    @confirmed_dev = Developer.create(phone_number: "1234456", confirmed: true)
    @affirmations = Affirmation.create([{affirmation: "this is one"}, {affirmation: "this is two"}, {affirmation: "this is three"}])
  end

  it 'enques the text' do
    ActiveJob::Base.queue_adapter = :test
    expect { SendAffirmationJob.new.deliver(@confirmed_dev, @affirmations.first) }.to have_enqueued_job
  end
end

