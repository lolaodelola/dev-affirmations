class Affirmation < ApplicationRecord
  has_many :developers
  has_many :developers, through: :sent_affirmation
  validates_presence_of :affirmation
end
