class Developer < ApplicationRecord
  validates_presence_of :phone_number
  before_create :generate_uuid
  after_create :send_confirmation_text
  scope :confirmed, -> { where(confirmed: true) }

  private
  def send_confirmation_text
    ConfirmationText.new.message(self)
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
