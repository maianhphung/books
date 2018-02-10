class Review < ApplicationRecord
	belongs_to :book
	belongs to :user
end
