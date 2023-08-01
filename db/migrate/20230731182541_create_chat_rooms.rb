# frozen_string_literal: true

class CreateChatRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :selected, default: true

      t.timestamps
    end
  end
end
