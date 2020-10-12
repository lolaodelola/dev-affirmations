class Developer < ApplicationRecord
  validates_presence_of :phone_number
  before_create :generate_uuid
  scope :confirmed, -> { where(confirmed: true) }
  scope :to_be_deleted, -> { where(confirmed: false).where("created_at >": (Date.today - 2.days)) }

  private
  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
