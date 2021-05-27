class Answer < ApplicationRecord
	belongs_to :survey
	belongs_to :question

	validates :content, presence: true
	validates :content, length: { in: 3..100 }

end
