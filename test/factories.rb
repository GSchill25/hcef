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
    date
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
    start_date
    end_date
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
    date_enrolled
  end

  factory :field_trip do
    association :program
    length 10
    notes "Sample program"
  end

  factory :guardian_location do
    association :locatoin
    association :guardian
    start_date
    end_date
  end

  factory :guardian do
    association :user
    first_name
    last_name
    phone
    email
    date_of_birth
  end

  factory :instructor do
    association :user
    first_name
    last_name
  end

  factory :location do
    name
    address_line_one
    address_line_two
    city
    start_date
    zip
    phone
  end

  factory :program do
    association :location
    name
    program_type
    start_date
    end_date
  end

  factory :provider do
    name
  end

  factory :school do
    name
    phone
    address_line_one
    address_line_two
    city
    state
    zip
  end

  factory sub_location do
    association :location
    name
    address_line_one
    address_line_two
    city
    statezip
    phone
  end

  factory user do
    username
    password
    password_confirmation
    role
    active
  end
end