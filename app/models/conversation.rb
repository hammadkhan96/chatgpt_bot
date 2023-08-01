# frozen_string_literal: true

class Conversation < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :chat_room

  enum role: { system: 0, assistant: 10, user: 20 }

  after_create_commit -> { broadcast_created }

  def broadcast_created
    broadcast_append_later_to(
      "#{dom_id(chat_room)}_conversations",
      partial: 'conversations/conversation',
      locals: { conversation: self, scroll_to: true },
      target: "#{dom_id(chat_room)}_conversations"
    )
  end

  def self.for_openai(conversations)
    conversations.map { |conversation| { role: conversation.role, content: conversation.message } }
  end
end
