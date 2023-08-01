# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :deselect_all, only: %i[show create]
  before_action :set_chat_room, only: %i[show]

  def index
    @chat_rooms = ChatRoom.order(created_at: :desc)
    @chat_room = ChatRoom.selected_chat_room.first
  end

  def show
    @chat_room
  end

  def create
    @chat_room = current_user.chat_rooms.create!

    redirect_to root_path
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.update!(selected: true)
  end

  def deselect_all
    return unless current_user.chat_rooms.present?

    ChatRoom.deselect_all
  end
end
