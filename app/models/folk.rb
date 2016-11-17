class Folk < ApplicationRecord
  has_many :messages

  validates :name, :phone_number, :message, presence: true

  before_create :normalize_phone

  def self.normalize_phone(number)
    number.gsub(/^\+/, "")
          .gsub(/(^1|\D+)/, "")
  end

  def send_sms
    twilio_number = ENV['twilio_number']
    client = Twilio::REST::Client.new
    client.messages.create(
      from: twilio_number,
      to:   phone_number,
      body: message
    )
  end

  def normalize_phone
    self.phone_number = self.class.normalize_phone(phone_number)
  end

  def message_count
    messages.count + 1
  end


end
