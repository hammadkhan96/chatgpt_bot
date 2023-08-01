# frozen_string_literal: true

class ConversationsController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @conversation = Conversation.create(conversation_params.merge(role: 'user', chat_room_id: params[:chat_room_id]))
    puts "conversation#create"
    GetChatgptResponse.perform_async(@conversation.chat_room_id)
    puts "conversation#create after job"


    respond_to(&:turbo_stream)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:message, :chat_room_id)
  end
end
