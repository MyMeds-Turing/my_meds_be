# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/meds_controller.rb
    class MedsController < ApplicationController
      def index
        render json: MedSerializer.new(Medication.all), status: :ok
      end

      def show
        render json: MedSerializer.new(Medication.find(params[:id])), status: :ok
      end
    end
  end
end
