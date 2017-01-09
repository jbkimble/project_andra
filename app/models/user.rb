class User < ApplicationRecord
  has_secure_password
  validates :first_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password

  has_many :experiments
end
