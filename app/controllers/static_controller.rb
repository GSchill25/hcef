class StaticController < ApplicationController
  def home
  end

  def login
  end

  def master_view_new
    @locations = Location.all.alphabetical
  end

  def master_view_submit
    location_indices = params["locations"]
    if !location_indices.nil?
      # Cast location_indices to integers
      location_indices.map!(&:to_i)
      # Rejects all locations that are in the ith index spot of the array
      allLocations = Location.all.alphabetical
      locations = allLocations.reject!.with_index { |l, i| !location_indices.include? i }
      # The case where all locations are selected, so reject! will return nil since there is no change from allLocaitons
      locations = allLocations if locations.nil?
      after_schools = []
        #Data of one element: [child record, avg homework, avg literacy, avg technology, avg reading_specialist, total_time]
        after_schools_children = []
      enrichments = []
        enrichments_days = []
        #Data of one element: child record
        enrichments_children = []
      field_trips = []
        field_trips_days = []
        #Data of one element: child record
        field_trips_children = []
        after_school_index = 0
        enrichment_index = 0
        field_trip_index = 0
      locations.each do |l|
        l.programs.each_with_index do |p, i|
          # Gather all program_types
          if p.program_type == 'after_school'
            after_schools << p
            after_schools_children[after_school_index] = [] if after_schools_children[after_school_index].nil?
            #Gather all children data
            p.children.each do |c|
              puts "here #{after_school_index}"
              puts p
              # Format: [[homework, time], [literacy, time], [technology, time], [readingSpecialist, time], [physical, time], [handson, time]]
              times = c.average_activity_time
              if times.nil?
                after_schools_children[after_school_index] << [c, 0, 0, 0, 0, 0, 0, 0]
              else
                averages = [c]
                # Gather averages for each category into an array
                for category in times
                  averages << category[1]
                end
                # Include the child's total time
                averages << c.total_time
                after_schools_children[after_school_index] << averages
              end
            end
            after_school_index += 1
            puts "there #{after_school_index}"
          elsif p.program_type == 'enrichment'
            enrichments << p
            enrichments_days << p.enrichments.count
            enrichments_children[enrichment_index] = [] if enrichments_children[enrichment_index].nil?
            #Gather all children data
            p.children.each do |c|
              enrichments_children[enrichment_index] << c
            end
            enrichment_index += 1
          elsif p.program_type == 'field_trip'
            field_trips << p
            field_trips_days << p.field_trips.count
            field_trips_children[field_trip_index] = [] if field_trips_children[field_trip_index].nil?
            #Gather all children data
            p.children.each do |c|
              field_trips_children[field_trip_index] << c
            end
            field_trip_index += 1
          end
        end
      end
    end
    render :json => {locations: locations, after_schools: after_schools, enrichments: enrichments, field_trips: field_trips, after_schools_children: after_schools_children, enrichments_children: enrichments_children, field_trips_children: field_trips_children, enrichments_days: enrichments_days, field_trips_days: field_trips_days}
  end



  def admin_dash
    @student_count = Child.all.count
    @program_count = Program.all.count
    @afterschool = Program.where("program_type=?", "after_school").count
    @enrichment = Program.where("program_type=?", "enrichment").count
    @field_trip = Program.where("program_type=?", "field_trip").count
    @location_count = Location.all.count
    @q = Child.ransack(params[:q])
    @children = @q.result(distinct: true).alphabetical.paginate(:page => params[:children_page], :per_page => 10)
    #@children = Child.all.alphabetical.paginate(:page => params[:children_page], :per_page => 10)
    @instructors = Instructor.all.alphabetical.paginate(:page => params[:instructors_page], :per_page => 10)
    @locations = Location.all.alphabetical.paginate(:page => params[:locations_page], :per_page => 10)
    @schools = School.all.paginate(:page => params[:schools_page], :per_page => 10)
  end

  def download_children
    package = Axlsx::Package.new
    workbook = package.workbook
    @children = Child.alphabetical
    time_list = []
    @children.each do |c|
      times = c.average_activity_time
      if times.nil?
        time_list << [["Homework", 0], ["Literacy", 0], ["Technology", 0], ["Reading Specialist", 0], ["Physical Activity", 0], ["Hands On Time", 0]]
      else
        time_list << times
      end
    end

    workbook.add_worksheet(name: "Children") do |sheet|
      sheet.add_row ["ID", "First Name","Last Name","Date of Birth", "Active","Guardian", "Programs", "Homework", "Literacy", "Technology", "Reading Specialist", "Physical Activity", "Hands On Time"]
      @children.each do |child|
        guardian = child.guardian.blank? ? "" : child.guardian.name
        sheet.add_row [child.id, child.first_name ,child.last_name,child.date_of_birth,child.active, guardian, child.programs.count, time_list[0][0][1], time_list[0][1][1], time_list[0][2][1], time_list[0][3][1], time_list[0][4][1], time_list[0][5][1]]
        time_list=time_list[1..time_list.length]
      end\
    end
    package.serialize('children.xlsx')
    send_file("children.xlsx", filename: "children.xlsx", type: "application/vnd.ms-excel")
  end

  def download_programs
    package = Axlsx::Package.new
    workbook = package.workbook
    @programs = Program.alphabetical
    time_list = []
    @programs.each do |p|
      times = p.average_time
      if times.nil?
        time_list << [["Homework", 0], ["Literacy", 0], ["Technology", 0], ["Reading Specialist", 0], ["Physical Activity", 0], ["Hands On Time", 0]]
      else
        time_list << times
      end
    end

    workbook.add_worksheet(name: "Programs") do |sheet|
      sheet.add_row ["ID", "Name","Start Date","End Date", "Average Homework", "Average Literacy", "Average Technology", "Average Reading Specialist", "Physical Activity", "Hands On Time"]
      @programs.each do |p|
        @end_date = p.end_date if !p.end_date.nil?
        sheet.add_row [p.id, p.name, p.start_date, @end_date, time_list[0][0][1], time_list[0][1][1], time_list[0][2][1], time_list[0][3][1], time_list[0][4][1], time_list[0][5][1]]
        time_list=time_list[1..time_list.length]
      end
    end
    package.serialize('programs.xlsx')
    send_file("programs.xlsx", filename: "programs.xlsx", type: "application/vnd.ms-excel")
  end
end
