# frozen_string_literal: true

class User < ApplicationRecord
  enum :role, %i[user admin], suffix: true, default: :user

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
