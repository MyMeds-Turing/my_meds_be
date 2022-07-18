# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Notification.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('notifications')
Prescription.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('prescriptions')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

Notification.create!(recipient: 'John', sent_at: Time.now, notification_type: 'sms')
Notification.create!(recipient: 'John H', sent_at: Time.now, notification_type: 'email')

user = User.create!(first_name: 'John', last_name: 'Lennon', email: 'John.Lennon@email.com',
                    sms: '5551234567', notify: 3)

user2 = User.create!(first_name: 'Paul', last_name: 'McCartney', email: 'Paul.McCartney@email.com',
                     sms: '5551234567', notify: 3)

user3 = User.create!(first_name: 'George', last_name: 'Harrison', email: 'George.Harrison@email.com',
                     sms: '5551234567', notify: 3)

user4 = User.create!(first_name: 'Ringo', last_name: 'Starr', email: 'Ringo.Starr@email.com',
                     sms: '5551234567', notify: 3)

Prescription.create!(user_id: user.id, med_name: 'Tylenol', time_of_last_dose: Time.current,
                     time_of_next_dose: 1.days.from_now, total_doses: 500, doses_remaining: 500,
                     max_daily_doses: 6, dose: '200 mg', user_instructions: 'take pill, take with food',
                     additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user2.id, med_name: 'Tylenol', time_of_last_dose: Time.current,
                     time_of_next_dose: 1.days.from_now, total_doses: 500, doses_remaining: 500,
                     max_daily_doses: 6, dose: '200 mg', user_instructions: 'take pill, take with food',
                     additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user3.id, med_name: 'Tylenol', time_of_last_dose: Time.current,
                     time_of_next_dose: 1.days.from_now, total_doses: 500, doses_remaining: 500,
                     max_daily_doses: 6, dose: '200 mg', user_instructions: 'take pill, take with food',
                     additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user.id, med_name: 'OxyContin', time_of_last_dose: Time.current,
                     time_of_next_dose: 2.days.from_now, total_doses: 25, doses_remaining: 2,
                     max_daily_doses: 4, dose: '5 mg', user_instructions: 'take pill, take with food',
                     additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user.id, med_name: 'Motrin', time_of_last_dose: Time.current,
                     time_of_next_dose: 16.hours.from_now, total_doses: 250, doses_remaining: 250,
                     max_daily_doses: 4, dose: '200 mg', user_instructions: 'take pill, take with food',
                     additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user2.id, med_name: 'Motrin Extra-Strength', time_of_last_dose: Time.current,
                     time_of_next_dose: 16.days.from_now, total_doses: 250, doses_remaining: 250,
                     max_daily_doses: 4, dose: '500 mg', user_instructions: 'take pill, take with food',
                     additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')

Prescription.create!(user_id: user.id, med_name: 'Motrin Extra-Strength', time_of_last_dose: Time.current,
                     time_of_next_dose: 16.days.from_now, total_doses: 100, doses_remaining: 250,
                     max_daily_doses: 4, dose: '500 mg', user_instructions: 'take pill, take with food',
                     additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                     icon: 'path_to_icon')
