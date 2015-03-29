FactoryGirl.define do
  
  factory :after_schools do
    date Date.new(2014,7,14)
    time_in DateTime.new(2012, 07, 11, 20, 10, 0)
    time_out DateTime.new(2012, 07, 11, 21, 10, 0)
    total_hours 5
    homework_time 2
    literacy_time 2
    technology_time 1
    reading_specialist_time 0
    goal "To finish homework and read some books"
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
  end

  factory :assignments do
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :instructor
    association :program
  end

  factory :child_locations do
    start_date Date.new(2014,7,14)
    end_date Date.new(2015,7,14)
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :child
    association :location
  end

  factory :child do
    first_name "John"
    last_name "Doe"
    date_of_birth Date.new(2007,3,1)
    grade 5
    active true
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :school
    association :guardian
  end
  
  factory :enrichment do
    length 10
    text "This Enrichment program is safe for students"
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :program
    association :provider
  end

  factory :enrollment do
    date_enrolled Date.new(2014,7,14)
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :program
    association :child
  end
  
  factory :field_trips do
    length 10
    text "This Field Trip is safe for students"
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :program
  end

  factory :guardians do
    first_name "Mark"
    last_name "Doe"
    phone "412-555-1234"
    email "markdoe@example.com"
    date_of_birth Date.new(1984,7,14)
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :user
  end

  factory :instructors do
    first_name "Mark"
    last_name "Heimann"
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
    association :user
  end

  factory :locations do
    name "CMU"
    address_line_one "5000 Forbes Avenue"
    address_line_two ""
    city "Pittsburgh"
    state "PA"
    zip 15213
    phone "412-555-4321"
    created_at DateTime.new(2012, 07, 11, 20, 10, 0)
    updated_at DateTime.new(2012, 07, 11, 22, 10, 0)
  end

  factory :programs do
    

  #-----------------------------------------------HUE

  factory :camp do 
    cost 125
    start_date Date.new(2014,7,14)
    end_date Date.new(2014,7,18)
    time_slot "am"
    max_students 8
    active true
    association :curriculum
    association :location
  end
  
  factory :camp_instructor do 
    association :camp
    association :instructor
  end

  factory :location do
    name "Carnegie Mellon"
    street_1 "5000 Forbes Avenue"
    street_2 "Porter Hall 222"
    city "Pittsburgh"
    state "PA"
    zip "15213"
    max_capacity 16
    active true
  end
  
  factory :student do
    first_name "Ted"
    last_name "Gruberman"
    association :family
    # rating 100
    date_of_birth 10.years.ago.to_date
    active true
  end

  factory :family do
    family_name "Gruberman"
    parent_first_name "Ed"
    email { |f| "#{f.parent_first_name}.#{f.family_name}#{(1..99).to_a.sample}@example.com".downcase }
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    active true
  end

  factory :registration do
    association :camp
    association :student
    payment_status "deposit"
    points_earned 0
  end

  factory :user do
    association :instructor
    username "mheimann"
    password "secret"
    password_confirmation "secret"
    role "admin"
    active true
  end

end