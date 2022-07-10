class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :med_name
      t.time :time_of_last_dose
      t.time :time_of_next_dose
      t.integer :total_doses
      t.integer :doses_remaining
      t.integer :max_daily_doses
      t.text :instructions
      t.integer :time_between_dose

      t.references :user
      t.timestamps

    end
  end
end
