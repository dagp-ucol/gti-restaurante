# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :employees
  has_many :attendances

  validates :name, presence: true
  validates :address, presence: true
end
