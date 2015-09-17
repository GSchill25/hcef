module DebugTools
  def self.count_objects
    ActiveRecord::Base.logger.level = 1

    output =  <<-EOS
      Child: #{Child.count}
      Guardian: #{Guardian.count}
      Enrollments: #{Enrollment.count}
      After Schools: #{AfterSchool.count}
      Programs: #{Program.count}
      Child Locations: #{ChildLocation.count}
      Locations: #{Location.count}
      Field Trip Days: #{FieldTripDay.count}
      Field Trips: #{FieldTrip.count}
      Enrichment Days: #{Enrichment.count}
      Enrichments: #{Enrichment.count}
    EOS

    print output
  end
end
