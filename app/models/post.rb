class Post < ApplicationRecord
	validates :title, presence: true, length: { minimum: 3, maximum: 10 }
	validates :description, presence: true, length: { minimum: 10, maximum: 50 }
	validates :reaction, presence: true, length: { maximum: 10 }
end
