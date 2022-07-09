# app/controllers/api/v1/meds_controller.rb
class Api::V1::MedsController < ApplicationController

  def index
    render json: MedSerializer.new(Medication.all), status: :ok
  end

end
