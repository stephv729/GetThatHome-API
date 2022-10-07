# frozen_string_literal: true

class SavedPropertySerializer < ActiveModel::Serializer
  attributes :id, :favorite, :contacted
  belongs_to :property
end
