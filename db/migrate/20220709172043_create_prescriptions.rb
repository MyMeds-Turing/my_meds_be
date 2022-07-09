class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :med_name
      t.time :last_dose
      t.time :next_dose
      t.integer :initial_amount
      t.integer :amount_remaining
      t.text :instructions

      t.references :user
    end
  end
end
