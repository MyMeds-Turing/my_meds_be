# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Medication.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('medications')

med1 = Medication.create!(name:'Tylenol', dose:'200 mg', time_between_dose: 4)
med2 = Medication.create!(name:'OxyContin', dose:'5 mg', time_between_dose: 4)
med3 = Medication.create!(name:'Motrin', dose:'500 mg', time_between_dose: 4)
