# frozen_string_literal: true

class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :message
      t.integer :role
      t.references :chat_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
