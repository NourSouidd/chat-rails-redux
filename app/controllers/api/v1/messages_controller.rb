class Api::V1::MessagesController < ApplicationController
  before_action :find_channel_name

  def index
   messages = @channel.messages.order(created_at: :asc)
   render json: messages
  end

  def create
    message = @channel.message.new(content: params[:content])
    message.user = current_user
    message.save
    render json: message

  end

  private

  def find_channel_name
    @channel = Channel.find_by(name: params[:channel_id])
  end

end
