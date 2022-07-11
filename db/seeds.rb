# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Prescription.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('prescriptions')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

user = User.create!(first_name: 'John', last_name: 'H', email: 'John.H@email.com',
                    sms: '5551234567', notify: 3)

Prescription.create!(user_id: user.id, med_name: 'Tylenol', time_of_last_dose: Time.current,
                     time_of_next_dose: 4.hours.from_now, total_doses: 500, doses_remaining: 500,
                     max_daily_doses: 6, user_instructions: "['take pill', 'take with food']",
                     doctor_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user.id, med_name: 'OxyContin', time_of_last_dose: Time.current,
                     time_of_next_dose: 4.hours.from_now, total_doses: 25, doses_remaining: 25,
                     max_daily_doses: 4, user_instructions: "['take pill', 'take with food']",
                     doctor_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user.id, med_name: 'Motrin', time_of_last_dose: Time.current,
                     time_of_next_dose: 4.hours.from_now, total_doses: 250, doses_remaining: 250,
                     max_daily_doses: 4, user_instructions: "['take pill', 'take with food']",
                     doctor_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')
