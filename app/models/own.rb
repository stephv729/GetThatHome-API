# frozen_string_literal: true

class Own < ApplicationRecord
  belongs_to :user
  belongs_to :ownable, polymorphic: true

  def property_details
    # case ownable_type
    # when "PropertyForRent"
    #   model = PropertyForRent
    # when "PropertyForSale"
    #   model = PropertyForSale
    # end
    Rails.application.eager_load!
    model = ApplicationRecord.descendants.find {|model| model.name==ownable_type}
    model.find(ownable_id)
  end
end
