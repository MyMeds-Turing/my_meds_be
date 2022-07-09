require 'rails_helper'

describe "Meds API" do
  it "sends a list of meds" do
    med1 = Medication.create!(name:'Tylenol', dose:'200 mg', time_between_dose: 4)
    med2 = Medication.create!(name:'OxyContin', dose:'5 mg', time_between_dose: 4)
    med3 = Medication.create!(name:'Motrin', dose:'500 mg', time_between_dose: 4)

    get '/api/v1/meds'

    expect(response).to be_successful
    meds = JSON.parse(response.body, symbolize_names: true)

    expect(meds.count).to eq(3)

    meds.each do |med|
     expect(med).to have_key(:id)
     expect(med[:id]).to be_an(Integer)

     expect(med).to have_key(:name)
     expect(med[:name]).to be_a(String)

     expect(med).to have_key(:dose)
     expect(med[:dose]).to be_a(String)

     expect(med).to have_key(:time_between_dose)
     expect(med[:time_between_dose]).to be_an(Integer)

   end
  end
end
