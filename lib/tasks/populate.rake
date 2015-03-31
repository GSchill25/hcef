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

    a_user = User.new
    a_user.username = 'admin'
    a_user.password = 'admin'
    a_user.password_confirmation = 'admin'
    a_user.role = 'admin'
    a_active = true
    a_user.save!

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
    hearth.address_line_two = 'abc'
    hearth.city = 'Glenshaw'
    hearth.state = 'PA'
    hearth.zip = '15116'
    hearth.phone = '4123669801'
    hearth.save!

    hearth = Location.new
    hearth.name =  'Sojourner House'
    hearth.address_line_one = '1234 Pitt Street'
    hearth.address_line_two = 'PO Box 1234'
    hearth.city = 'Pittsburgh'
    hearth.state = 'PA'
    hearth.zip = '15213'
    hearth.phone = '1234567890'
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

      cl= ChildLocation.new
      cl.child = c1
      cl.location = Location.first
      cl.save!

      c2 = Child.new
      c2.first_name = Faker::Name.first_name
      c2.last_name = g.last_name
      c2.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
      c2.grade = rand(1..8)
      c2.active = true
      c2.guardian_id = g.id
      c2.save!

      cl2= ChildLocation.new
      cl2.child = c2
      cl2.location = Location.last
      cl2.save!
    end

    # StudentInfo

    # Program
     Program.populate 10 do |p|
       p.name = Faker::Company.name
       p.program_type = "after_school"
       p.start_date = Faker::Date.between(5.years.ago, 1.year.ago)
       p.end_date = p.start_date + 200.days
       p.location_id = hearth.id
     end

=begin    
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
=end

    #Enrollment

    #Assignment

    #AfterSchool

    #Provider

    #Enrichment

    #FieldTrip
  end
end
