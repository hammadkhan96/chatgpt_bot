# frozen_string_literal: true

class ConversationsController < ApplicationController
  include ActionView::RecordIdentifier
  after_action :run_job

  def create
    @conversation = Conversation.create(conversation_params.merge(role: 'user', chat_room_id: params[:chat_room_id]))
    # GetChatgptResponse.perform_async(@conversation.chat_room_id)

    respond_to(&:turbo_stream)
  end

  private

  def run_job
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @response = OpenAI::Client.new.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: Conversation.for_openai(@chat_room.conversations),
        temperature: 0.1
      }
    )

    Conversation.create!(chat_room_id: @chat_room.id, role: 'assistant', message: @response.dig('choices', 0, 'message', 'content'))
  end

  def conversation_params
    params.require(:conversation).permit(:message, :chat_room_id)
  end
end
