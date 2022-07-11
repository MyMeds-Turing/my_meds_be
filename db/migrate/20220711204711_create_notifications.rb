# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :recipient
      t.datetime :sent_at
      t.string :notification_type

      t.timestamps
    end
  end
end
