namespace :affirmation do
  task :send_text => :environment do |task, args|
    count = Affirmation.count
    random_offset = rand(count)
    affirmation = Affirmation.offset(random_offset).first
    Developer.confirmed.each do |dev|
      SendAffirmationJob.new.deliver(dev, affirmation)
      SentAffirmation.create!(developer_id: dev.id, affirmation_id: affirmation.id, sent_at: DateTime.now)
    end
  end
end