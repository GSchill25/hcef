FactoryGirl.define do
  
  factory :curriculum do
    name "Mastering Chess Tactics"
    description "This camp is designed for any student who has mastered basic mating patterns and understands opening principles and is looking to improve his/her ability use chess tactics in game situations."
    min_rating 400
    max_rating 850
    active true
  end
  
  factory :after_school do
    association :program
    association :child
    date Date.today
    time_in 
    time_out 
    total_hours 6
    homework_time 2
    literacy_time 2
    technology_time 1
    reading_specialist_time 1
    goal "To finish most of the worl for the day"
  end

  factory :assignment do
    association :location
    association :instructor
  end

  factory :child_location do
    association :child
    association :location
    start_date Date.today
    end_date Date.today
  end

  factory :child do
    association :school
    association :guardian
    first_name "Howard"
    last_name "Junior"
    date_of_birth
    grade 7
    active true
  end

  factory :enrichment do
    association :program
    association :provider
    length 10
    notes "Sample Enrichment"
  end

  factory :enrollment do
    association :program
    association :child
    date_enrolled Date.today
  end

  factory :field_trip do
    association :program
    length 10
    notes "Sample program"
  end

  factory :guardian_location do
    association :locatoin
    association :guardian
    start_date Date.today
    end_date Date.today
  end

  factory :guardian do
    association :user
    first_name "James"
    last_name "Kim"
    phone "4125551234"
    email "jkim@sample.com"
    date_of_birth
  end

  factory :instructor do
    association :user
    first_name "Alex"
    last_name "Kim"
  end

  factory :location do
    name "Starbucks"
    address_line_one "417 S Craig Street"
    address_line_two ""
    city "Pittsburgh"
    state "PA"
    zip 15213
    phone "4125550987"
  end

  factory :program do
    association :location
    name "Afterschool Program"
    program_type "after_school"
    start_date Date.today
    end_date Date.today
  end

  factory :provider do
    name "CMU Provider"
  end

  factory :school do
    name "CMU"
    phone "4125551234"
    address_line_one "5000 Forbes Ave"
    address_line_two ""
    city "Pittsburgh"
    state "PA"
    zip 15213
  end

  factory :sub_location do
    association :location
    name "Skibo Cafe"
    address_line_one "5000 Forbes Ave"
    address_line_two ""
    city "Pittsburgh"
    state "PA"
    zip 15213
    phone "4125551111"
  end

  factory :user do
    username "admin"
    password "password"
    password_confirmation "password"
    role "admin"
    active true
  end
end