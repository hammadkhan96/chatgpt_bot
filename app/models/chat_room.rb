# frozen_string_literal: true

class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :conversations, dependent: :destroy

  scope :selected_chat_room, -> { where(selected: true) }

  def self.deselect_all
    ChatRoom.all.each { |chat_room| chat_room.update(selected: false) }
  end

  def self.select_chat_room(chat_room)
    chat_room.update!(selected: true)
  end
end
