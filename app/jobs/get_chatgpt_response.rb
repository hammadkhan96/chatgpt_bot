# frozen_string_literal: true

class GetChatgptResponse
  include Sidekiq::Worker

  def perform(chat_room_id)
    @chat_room = ChatRoom.find(chat_room_id)
    call_openai(@chat_room)
  end

  private

  def call_openai(chat_room)
    begin
      @response = OpenAI::Client.new.chat(
        parameters: {
          model: 'gpt-3.5-turbo',
          messages: Conversation.for_openai(chat_room.conversations),
          temperature: 0.1
        }
      )
  
      Conversation.create!(chat_room_id: chat_room.id, role: 'assistant', message: @response.dig('choices', 0, 'message', 'content'))
  
    rescue StandardError => e
      puts "Error occurred: #{e.message}"
    end
  end
end
