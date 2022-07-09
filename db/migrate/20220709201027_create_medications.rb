class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dose
      t.datetime :time_between_dose

      t.timestamps
    end
  end
end
