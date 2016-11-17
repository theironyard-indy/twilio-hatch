class MessagesController < ApplicationController

  def create
    @message = Message.new
    @message.body = params[:Body]
    @message.folk = Folk.find_by_phone_number(normalized_from)
    @message.save
    if @message.folk.messages.count > 1
      message_body = "Thanks!"
    else
      message_body = "Thanks! Learn more about TIY here: http://theironyard.com/indy"
    end
    Twilio::REST::Client.new.messages.create(
      to: @message.folk.phone_number,
      from: ENV['twilio_number'],
      body: message_body
    )
  end

  def index
    @messages = Message.all
    render json: @messages
  end

  private

  def normalized_from
    Folk.normalize_phone(params[:From])
  end

end
