# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :attendances

  before_create :random_private_number

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }
  validates :position, presence: true

  private

  def random_private_number
    self.private_number = rand(1000000000..9999999999)
  end
end
