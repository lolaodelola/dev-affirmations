class SentAffirmation < ApplicationRecord
  belongs_to :developer
  belongs_to :affirmation
end
