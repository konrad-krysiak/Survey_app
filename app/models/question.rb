class Question < ApplicationRecord
	belongs_to :survey
	has_many :answers


	validates :content, presence: true
	validates :content, length: { in: 3..50 }
end
