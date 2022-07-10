# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

describe 'Meds API' do
  it 'sends a list of meds' do
    Medication.create!(name: 'Tylenol', dose: '200 mg', time_between_dose: 4)
    Medication.create!(name: 'OxyContin', dose: '5 mg', time_between_dose: 4)
    Medication.create!(name: 'Motrin', dose: '500 mg', time_between_dose: 4)

    get '/api/v1/meds'

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    meds = response_body[:data]

    expect(meds.count).to eq(3)

    meds.each do |med|
      expect(med).to have_key(:id)
      expect(med[:id]).to be_a(String)
      expect(med[:type]).to be_a(String)
      expect(med[:attributes]).to be_a(Hash)

      expect(med[:attributes]).to have_key(:name)
      expect(med[:attributes][:name]).to be_a(String)

      expect(med[:attributes]).to have_key(:dose)
      expect(med[:attributes][:dose]).to be_a(String)

      expect(med[:attributes]).to have_key(:time_between_dose)
      expect(med[:attributes][:time_between_dose]).to be_an(Integer)
    end
  end

  it 'sends data for one med given id' do
    med = Medication.create!(name: 'Tylenol', dose: '200 mg', time_between_dose: 4)
    med2 = Medication.create!(name: 'OxyContin', dose: '5 mg', time_between_dose: 4)

    get "/api/v1/meds/#{med.id}"

    data_response = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to have_http_status(:ok)
    expect(response).to be_successful

    expect(data_response.count).to eq(3)
    expect(data_response).to have_key(:id)
    expect(data_response[:type]).to eq('med')
    expect(data_response[:attributes]).to include(:name)
    expect(data_response[:attributes][:name]).to eq(med.name)
    expect(data_response[:id]).to_not eq(med2.id)
  end
  it 'can create a new med' do
    med_params = {
      name: 'Asprin',
      dose: '200 mg',
      time_between_dose: 4
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }
    # include this header to make sure params are passed as JSON rather than as plain text

    post '/api/v1/meds', headers: headers, params: JSON.generate(med: med_params)

    created_med = Medication.last

    expect(response).to be_successful
    expect(created_med.name).to eq(med_params[:name])
    expect(created_med.dose).to eq(med_params[:dose])
    expect(created_med.time_between_dose).to eq(med_params[:time_between_dose])
  end
end
# rubocop:enable Metrics/BlockLength
