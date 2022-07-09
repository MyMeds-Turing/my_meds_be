require 'rails_helper'

describe "Meds API" do
  it "sends a list of meds" do
    med = create(:medication)

    get '/api/v1/meds'

    expect(response).to be_successful
  end
end
