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

    avac = Location.new
    avac.name = 'Allegheny Valley A.C.'
    avac.save!

    akah = Location.new
    akah.name = 'Alle-Kiski Area HOPE'
    akah.save!
    
    auberle = Location.new
    auberle.name = 'Auberle'
    auberle.save!
      
      sp = SubLocation.new
      sp.name = 'Shelter Program'
      sp.location = auberle
      sp.save!
      
      moh = SubLocation.new
      moh.name = 'Movin\' on / Hartman'
      moh.location = auberle
      moh.save!

    bti = Location.new
    bti.name = 'Bridge to Independence'
    bti.save!

    cfv = Location.new
    cfv.name = 'Center for Victims'
    cfv.save!

    chs = Location.new
    chs.name = 'Community Human Services'
    chs.save!
    
    ccn = Location.new
    ccn.name = 'Crisis Center North'
    ccn.save!

    eec = Location.new
    eec.name = 'East End Cooperative'
    eec.save!

    familyLinks = Location.new
    familyLinks.name = 'Familylinks'
    familyLinks.save!

      dout = SubLocation.new
      dout.name = 'Downtown Outreach'
      dout.location = familyLinks
      dout.save!

      plum = SubLocation.new
      plum.name = 'Plum'
      plum.location = familyLinks
      plum.save!

      sylvan = SubLocation.new
      sylvan.name = 'Sylvan'
      sylvan.location = familyLinks
      sylvan.save!

    fpSWPA = Location.new
    fpSWPA.name = 'Family Promise SWPA'
    fpSWPA.save!

    ge = Location.new
    ge.name = 'Gaudenzia Erie'
    ge.save!

    glcc = Location.new
    glcc.name = 'Gay and Lesbian CC'
    glcc.save!

    gSWPA = Location.new
    gSWPA.name = 'Goodwill SWPA'
    gSWPA.save!
      
      healthyStart = SubLocation.new
      healthyStart.name = 'Healthy Start'
      healthyStart.location = gSWPA
      healthyStart.save!

      heart = SubLocation.new
      heart.name = 'HEART'
      heart.location = gSWPA
      heart.save!

    hearth = Location.new
    hearth.name = 'HEARTH'
    hearth.address_line_one = '3724 Mount Royal Blvd'
    hearth.address_line_two = 'abc'
    hearth.city = 'Glenshaw'
    hearth.state = 'PA'
    hearth.zip = '15116'
    hearth.phone = '4123669801'
    hearth.save!

    lol = Location.new
    lol.name = 'Light of Life'
    lol.save!
    
    np = Location.new
    np.name = 'Naomi\'s Place'
    np.save!
    
    sa = Location.new
    sa.name = 'Salvation Army'
    sa.save!

    soj = Location.new
    soj.name =  'Sojourner House'
    soj.address_line_one = '1234 Pitt Street'
    soj.address_line_two = 'PO Box 1234'
    soj.city = 'Pittsburgh'
    soj.state = 'PA'
    soj.zip = '15213'
    soj.phone = '1234567890'
    soj.save!
    
    sp = Location.new
    sp.name = 'Sisters Place'
    sp.save!
    
    sjm = Location.new
    sjm.name = 'Sojourner House MOMS'
    sjm.save!
    
    sjme = Location.new
    sjme.name = 'Sojourner House MOMS East'
    sjme.save!
    
      oa = SubLocation.new
      oa.name = 'Open Arms'
      oa.location = sjme
      oa.save!

      sankofa = SubLocation.new
      sankofa.name = 'Sankofa'
      sankofa.location = sjme
      sankofa.save!

    try = Location.new
    try.name = 'Three Rivers Youth'
    try.save!
    
      emergency = SubLocation.new
      emergency.name = 'Emergency'
      emergency.location = try
      emergency.save!

      th = SubLocation.new
      th.name = 'The Hub'
      th.location = try
      th.save!

    we = Location.new
    we.name = 'Womanspace East'
    we.save!

    wcs = Location.new
    wcs.name = 'Women\'s Center & Shelter'
    wcs.save!
    
    wp = Location.new
    wp.name = 'Western Psychiatric'
    wp.save!
    
    ygp = Location.new
    ygp.name = 'YWCA Greater Pittsburgh'
    ygp.save!
    




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
      cl2.location = Location.first
      cl2.save!
    end

    # StudentInfo

    # Program
     Program.populate 3 do |p|
       p.name = Faker::Company.name
       p.program_type = "after_school"
       p.start_date = Faker::Date.between(5.years.ago, 1.year.ago)
       p.end_date = p.start_date + 200.days
       p.location_id = hearth.id
     end



    #Sojourner House Test
    p2 = Program.new
    p2.name = "Sojourner House Moms Afterschool"
    p2.program_type = "after_school"
    p2.start_date = 1.year.ago.to_date
    p2.location_id = soj.id
    p2.save!


    s1 = School.new
    s1.name = "Sunnyside"
    s1.save!

    s2 = School.new
    s2.name = "Linden"
    s2.save!

    g1 = Guardian.new
    g1.first_name = "Markita"
    g1.last_name = "Clark"
    g1.phone = "4125551234"
    g1.email = Faker::Internet.email(g1.first_name)
    g1.date_of_birth = Faker::Date.between(35.years.ago, 25.years.ago)
    g1.save!

    g2 = Guardian.new
    g2.first_name = "Susan"
    g2.last_name = "Gormley"
    g2.phone = "4125551234"
    g2.email = Faker::Internet.email(g2.first_name)
    g2.date_of_birth = Faker::Date.between(35.years.ago, 25.years.ago)
    g2.save!

    g3 = Guardian.new
    g3.first_name = "Rasheedah"
    g3.last_name = "Jefferson"
    g3.phone = "4125551234"
    g3.email = Faker::Internet.email(g3.first_name)
    g3.date_of_birth = Faker::Date.between(35.years.ago, 25.years.ago)
    g3.save!

    g4 = Guardian.new
    g4.first_name = "Jessica"
    g4.last_name = "Bac"
    g4.phone = "4125551234"
    g4.email = Faker::Internet.email(g4.first_name)
    g4.date_of_birth = Faker::Date.between(35.years.ago, 25.years.ago)
    g4.save!

    g5 = Guardian.new
    g5.first_name = "Marcia"
    g5.last_name = "Gregory"
    g5.phone = "4125551234"
    g5.email = Faker::Internet.email(g5.first_name)
    g5.date_of_birth = Faker::Date.between(35.years.ago, 25.years.ago)
    g5.save!

    c1 = Child.new
    c1.first_name = "Milton"
    c1.last_name = "Clark"
    c1.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c1.grade = 4
    c1.active = true
    c1.guardian_id = g1.id
    c1.save!

    cl= ChildLocation.new
    cl.child = c1
    cl.location = Location.last
    cl.save!

    c2 = Child.new
    c2.first_name = "Tresean"
    c2.last_name = "Clark"
    c2.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c2.grade = 6
    c2.active = true
    c2.guardian_id = g1.id
    c2.save!

    cl2= ChildLocation.new
    cl2.child = c2
    cl2.location = Location.last
    cl2.save!

    c3 = Child.new
    c3.first_name = "Zamir"
    c3.last_name = "Clark"
    c3.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c3.grade = 1
    c3.active = true
    c3.guardian_id = g1.id
    c3.save!

    cl3= ChildLocation.new
    cl3.child = c3
    cl3.location = Location.last
    cl3.save!


    c4 = Child.new
    c4.first_name = "Gabriel"
    c4.last_name = "Hilliard"
    c4.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c4.grade = 4
    c4.active = true
    c4.guardian_id = g2.id
    c4.save!

    cl4= ChildLocation.new
    cl4.child = c4
    cl4.location = Location.last
    cl4.save!


    c5 = Child.new
    c5.first_name = "Micah"
    c5.last_name = "Hilliard"
    c5.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c5.grade = 1
    c5.active = true
    c5.guardian_id = g2.id
    c5.save!

    cl5= ChildLocation.new
    cl5.child = c5
    cl5.location = Location.last
    cl5.save!


    c6 = Child.new
    c6.first_name = "Lailah"
    c6.last_name = "Hilliard"
    c6.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c6.grade = 2
    c6.active = true
    c6.guardian_id = g3.id
    c6.save!

    cl6= ChildLocation.new
    cl6.child = c6
    cl6.location = Location.last
    cl6.save!


    c7 = Child.new
    c7.first_name = "Raheim"
    c7.last_name = "Jefferson"
    c7.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c7.grade = 4
    c7.active = true
    c7.guardian_id = g3.id
    c7.save!

    cl7= ChildLocation.new
    cl7.child = c7
    cl7.location = Location.last
    cl7.save!

    c8 = Child.new
    c8.first_name = "Raysha"
    c8.last_name = "Jefferson"
    c8.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c8.grade = 7
    c8.active = true
    c8.guardian_id = g3.id
    c8.save!

    cl8= ChildLocation.new
    cl8.child = c8
    cl8.location = Location.last
    cl8.save!

    c9 = Child.new
    c9.first_name = "Destini"
    c9.last_name = "Bac-Taylor"
    c9.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c9.grade = 5
    c9.active = true
    c9.guardian_id = g4.id
    c9.save!

    cl9= ChildLocation.new
    cl9.child = c9
    cl9.location = Location.last
    cl9.save!

    c10 = Child.new
    c10.first_name = "Elijah"
    c10.last_name = "Gregory"
    c10.date_of_birth = Faker::Date.between(12.years.ago, 7.years.ago)
    c10.grade = 4
    c10.active = true
    c10.guardian_id = g5.id
    c10.save!

    cl0= ChildLocation.new
    cl0.child = c10
    cl0.location = Location.last
    cl0.save!

    #Providers
    pv1 = Provider.new
    pv1.name = "Sydelle Pearl"
    pv1.save!

    pv2 = Provider.new
    pv2.name = "Petrie Dish: Edwin Gibson"
    pv2.save!

    pv3 = Provider.new
    pv3.name = "Art Expression, Inc."
    pv3.save!

    pv4 = Provider.new
    pv4.name = "The Andy Warhol Museum"
    pv4.save!

    pv5 = Provider.new
    pv5.name = "America's Arts & Music Crossroads Center"
    pv5.save!

    pv6 = Provider.new
    pv6.name = "Gateway to the Arts"
    pv6.save!

    pv7 = Provider.new
    pv7.name = "Lab Ratz Science Club"
    pv7.save!

    pv8 = Provider.new
    pv8.name = "Saturday Light Brigade Radio"
    pv8.save!

    pv9 = Provider.new
    pv9.name = "The Outdoor Classroom"
    pv9.save!

    pv10 = Provider.new
    pv10.name = "Ducky Tours"
    pv10.save!

    pv11 = Provider.new
    pv11.name = "Pittsburgh Zoo and PPG Aquarium"
    pv11.save!

    pv12 = Provider.new
    pv12.name = "Pittsburgh National Aviary"
    pv12.save!

    pv13 = Provider.new
    pv13.name = "Carnegie Science Center"
    pv13.save!

    pv14 = Provider.new
    pv14.name = "Children's Museum"
    pv14.save!
  end
end
