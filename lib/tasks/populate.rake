namespace :db do
  desc "Empty and populate database with sample data"
  task :populate => :environment do
    # Empty previous data
    [AfterSchool, Assignment, ChildLocation, Child, Enrichment, Enrollment, FieldTrip, Guardian, Instructor, Location, Program, Provider, School, User].each(&:delete_all)

    # User
    i_user = User.new
    i_user.username = 'instructor'
    i_user.password = 'instructor'
    i_user.password_confirmation = 'instructor'
    i_user.role = 'instructor'
    i_active = true
    i_user.save!

    # Instructor
    i = Instructor.new
    i.first_name = 'John'
    i.last_name = 'Instructoman'
    i.user_id = i_user.id
    i.save!

    #i_user.instructor_id = i.id
    #i_user.save!
    
    # Guardian
    Guardian.populate 20 do |g|
      g.first_name = Faker::Name.first_name
      g.last_name = Faker::Name.last_name
      g.phone = Faker::PhoneNumber.phone_number
      g.email = Faker::Internet.email(g.first_name)
      g.date_of_birth = Faker::Date.between(50.years.ago, 40.years.ago)
    end

    # School

    # Child
    Guardian.all.each do |g|
      c1 = Child.new
      c1.first_name = Faker::Name.first_name
      c1.last_name = g.last_name
      c1.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
      c1.grade = rand(1..8)
      c1.active = true
      c1.guardian_id = g.id
      c1.save!

      c2 = Child.new
      c2.first_name = Faker::Name.first_name
      c2.last_name = g.last_name
      c2.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
      c2.grade = rand(1..8)
      c2.active = true
      c2.guardian_id = g.id
      c2.save!
    end

    # StudentInfo
    
    # Location
    action = Location.new
    action.name = 'ACTION-Housing'
    action.address_line_one = '425 Sixth Avenue'
    action.address_line_two = '#950'
    action.city = 'Pittsburgh'
    action.state = 'PA'
    action.zip = '15219'
    action.phone = '4122812102'
    action.save!
    
    hearth = Location.new
    hearth.name = 'HEARTH'
    hearth.address_line_one = '3724 Mount Royal Blvd'
    hearth.address_line_two =
    hearth.city = 'Glenshaw'
    hearth.state = 'PA'
    hearth.zip = '15116'
    hearth.phone = '412-366-9801'
    hearth.save!
=begin
    # Future locations
    hearth = Location.new
    hearth.name = 
    hearth.address_line_one = 
    hearth.address_line_two =
    hearth.city =
    hearth.state = 'PA'
    hearth.zip =
    hearth.phone = 
    hearth.save!
=end
    # Program
    actionP = Program.new
    actionP.name = 'Action-Housing Program'
    actionP.program_type = 'after_school'
    actionP.start_date = Faker::Date.between(2.years.ago, Date.today)
    actionP.location_id = action.id

    hearthP = Program.new
    hearthP.name = 'HEARTH Program'
    hearthP.program_type = 'after_school'
    hearthP.start_date = Faker::Date.between(2.years.ago, Date.today)
    hearthP.location_id = hearth.id

    Enrollment

    Assignment

    AfterSchool

    Provider

    Enrichment

    FieldTrip
  end
end
