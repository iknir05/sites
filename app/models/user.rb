class User < ApplicationRecord
	validates :first_name,:last_name, presence: true, length: { minimum: 4, maximum: 20 }
	validates :email, presence: true, uniqueness: true,
	format:  { with: /\A[^@\s]+@[^@\s]+\z/, message: 'entered is invalid' }
	validates :gender, presence: true
	validates :phone_number, presence: true, :numericality => true,length: { minimum: 10, maximum: 10 }
	validates :password,:confirm_password, presence: true, length: { minimum: 4, maximum: 10 }	
end

