# frozen_string_literal: true

class Own < ApplicationRecord
  belongs_to :user
  belongs_to :ownable, polymorphic: true
end
