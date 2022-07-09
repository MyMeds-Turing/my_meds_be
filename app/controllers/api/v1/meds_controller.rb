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

      def create
        med = Medication.new(med_params)
        if med.save
          render json: MedSerializer.new(med), status: :created
        else
          render json: { message: 'medication not created' }, status: 400
        end
      end

      def destroy
        med = Medication.find(params[:id])
        med&.destroy
      end

      private

      def med_params
        params.permit(:name, :dose, :time_between_dose)
      end
    end
  end
end
