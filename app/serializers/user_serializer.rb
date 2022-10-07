# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id,:name, :phone, :email, :role_name
end
