class Developer < ApplicationRecord
  has_many :affirmations
  has_many :affirmations, through: :sent_affirmations
  validates_presence_of :phone_number
  before_create :generate_uuid
  scope :confirmed, -> { where(confirmed: true) }
  scope :to_be_deleted, -> { where(confirmed: false).where("created_at >": (Date.today - 2.days)) }

  private
  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
