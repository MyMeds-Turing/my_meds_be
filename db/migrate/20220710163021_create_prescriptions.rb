# frozen_string_literal: true

# rubocop:disable Metrics/Metrics/MethodLength

# comment for rubocop
class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :med_name
      t.datetime :time_of_last_dose
      t.datetime :time_of_next_dose
      t.integer :total_doses
      t.integer :doses_remaining
      t.integer :max_daily_doses
      t.text :user_instructions
      t.text :doctor_instructions
      t.integer :time_between_dose
      t.string :icon
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

# rubocop:enable Metrics/Metrics/MethodLength
