# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :store
  has_many :attendances

  before_create :random_private_number

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :position, presence: true

  private

  def random_private_number
    self.private_number = rand(1000..9999)
  end
end
