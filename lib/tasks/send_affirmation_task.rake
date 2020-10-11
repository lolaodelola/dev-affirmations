namespace :affirmation do
  task :send_text => :environment do |task, args|
    count = Affirmation.count
    random_offset = rand(count)
    affirmation = Affirmation.offset(random_offset).first
    Developer.confirmed.each do |dev|
      SendAffirmationJob.new.deliver(dev.phone_number, affirmation)
    end
  end
end