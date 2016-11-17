class FolksController < ApplicationController

  def create
    @folk = Folk.new(folk_params)
    if @folk.save
      message = Message.create(folk: @folk, body: params[:message])
      @folk.send_sms(message.body)
      render json: @folk, status: :created
    else
      render json: @folk.errors.full_messages,
                   status: :unprocessable_entity
    end
  end

  def index
    @folks = Folk.all
    render json: @folks
  end

  def show
    @folk = Folk.find(params[:id])
    render json: @folk
  end

  private

  def folk_params
    params.permit(:name, :phone_number)
  end
end
