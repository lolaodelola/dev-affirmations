require 'rails_helper'

RSpec.describe 'Affirmation' do
  before :all do
    @confirmed_developer = Developer.create(phone_number: "1234456573526", confirmed: true)
    @unconfirmed_developer = Developer.create(phone_number: "6789876544898", confirmed: false)
    @affirmations = Affirmation.create([{affirmation: "this is one"}, {affirmation: "this is two"}, {affirmation: "this is three"}])
    DevAffirmations::Application.load_tasks
    @task = Rake::Task['affirmation:send_text']
  end

  it 'should enqueue the job' do
    expect { @task.invoke }.to have_enqueued_job
  end

  # it 'should send the job to the confirmed developer' do
  #   @task.invoke
  #   binding.pry
  #   expect(SentAffirmation.find_by_developer_id(@confirmed_developer.id)).to_not be_nil
  # end
  #
  # it 'should not send the job to the unconfirmed developer' do
  #   @task.invoke
  #   expect(SentAffirmation.find_by_developer_id(@unconfirmed_developer.id)).to be_nil
  # end
end
