# This will guess the User class
FactoryBot.define do
    factory :survey do
        title { "Survey" }
        email { "asd@asd.pl" }
        question_count { 0 }
    end
end