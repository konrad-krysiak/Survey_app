class Survey < ApplicationRecord
    before_validation -> { 
        self.publicUrl = SecureRandom.hex(10)
     }, on: :create


    has_many :questions
    has_many :answers

    accepts_nested_attributes_for :answers
    accepts_nested_attributes_for :questions

    validates :title, presence: true
    validates :title, length: { in: 5..50 }
    validates :title, format: { with: /\A[a-zA-Z0-9 ]*\z/ }
    validates :question_count, numericality: { only_integer: true }
    validates :question_count, inclusion: 1..10
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :publicUrl, presence: true
    validate :validate_survey_limit, on: :create

    def validate_survey_limit
        if(Survey.where( email: self.email ).count >= 10)
            self.errors.add(:base, "User exceeded survey limit!")
        end
    end
end
