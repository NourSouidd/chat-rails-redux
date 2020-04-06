class Api::V1::MessagesController < ApplicationController
  before_action :find_channel_name
  def index
   messages = Message.order(created_at: :desc)
   render json: messages
  end

  def create
  end

  # private

  def find_channel_name
    channel = Channel.find_by(name: params[:id])
  end
end
