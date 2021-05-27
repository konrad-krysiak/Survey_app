class Survey < ApplicationRecord
    before_validation -> { 
        self.publicUrl = SecureRandom.hex(10)
     }, on: :create


    has_many :questions
    has_many :answers

    accepts_nested_attributes_for :answers
    accepts_nested_attributes_for :questions

    validates :title, presence: true
    validates :title, length: { in: 3..15 }
    validates :question_count, numericality: { only_integer: true }
    validates :question_count, inclusion: 1..10
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :publicUrl, presence: true
    validate :validate_survey_limit, on: :create

    def validate_survey_limit
        if(Survey.where( email: self.email ).count >= 7)
            self.errors.add(:base, "User exceeded survey limit!")
        end
    end
end
