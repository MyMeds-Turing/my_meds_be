# app/serializers/med_serializer.#!/usr/bin/env ruby -wKU
class MedSerializer
  include JSONAPI::Serializer
  attributes :name, :dose, :time_between_dose
end
