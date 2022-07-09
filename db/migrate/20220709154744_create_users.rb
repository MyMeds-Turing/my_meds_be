# frozen_string_literal: true

# create_table users
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :sms
      t.integer :notify

      t.timestamps
    end
  end
end
