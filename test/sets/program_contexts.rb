module Contexts
  module ProgramContexts
    def create_programs
      # assumes create_curriculums prior
      @program1 = FactoryGirl.create(:program, name: "AfterSchool", start_date: Date.new(2000,7,21), end_date: Date.today, program_type: "after_school", location: @cmu)  
      @program2 = FactoryGirl.create(:program, name: "Enrichment", start_date: Date.new(2000,7,25), end_date: Date.today, program_type: "enrichment", location: @cmu)
      @program3 = FactoryGirl.create(:program, name: "FieldTrip", start_date: Date.new(2000,7,20), end_date: Date.today, program_type: "field_trip", location: @upitt)
      @program4 = FactoryGirl.create(:program, name: "Inactive", start_date: Date.new(2000,7,19), end_date: Date.new(2001,7,22), program_type: "after_school", location: @upitt)
      @program5 - FactoryGirl.create(:program, name: "Upcoming", start_date: 10.days.from_now, end_date: 20.days.from_now, program_type: "enrichment", location: @upitt)
    end

    def delete_programs
      @program1.delete
      @program2.delete
      @program3.delete
      @program4.delete
      @program5.delete
      #delete_curriculums
    end

    #def create_past_programs
    #  # assumes create_more_curriculums prior
    #  @past_program1 = FactoryGirl.create(:program, name: "Past AfterSchool", start_date: Date.new(2050,7,21), end_date: Date.new(2050,7,22), program_type: "after_school", location: @fairfax)  
    #  @past_program2 = FactoryGirl.create(:program, name: "Past Enrichment", start_date: Date.new(2050,7,25), end_date: Date.new(2050,7,30), program_type: "enrichment", location: @upitt)
    #  @past_program3 = FactoryGirl.create(:program, name: "Past FieldTrip", start_date: Date.new(2050,7,20), end_date: Date.new(2050,7,30), program_type: "field_trip", location: @cmu) 
    #  @past_program1.start_date = Date.new(2000,7,21)
    #  @past_program1.end_date = Date.new(2000,7,22)
    #  @past_program1.save
    #  @past_program2.start_date = Date.new(2000,7,25)
    #  @past_program2.end_date = Date.new(2000,7,30)
    #  @past_program2.save
    #  @past_program3.start_date = Date.new(2000,7,20)
    #  @past_program3.end_date = Date.new(2000,7,30)
    #  @past_program3.save
    #end

    #def delete_past_camps
    #  @past_program1.delete
    #  @past_program2.delete
    #  @past_program3.delete
    #end
  end
end
