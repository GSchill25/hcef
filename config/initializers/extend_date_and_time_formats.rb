# Date
Date::DATE_FORMATS[:default] = "%m/%d/%Y" # mm/dd/yyyy

# DateTime
DateTime::DATE_FORMATS[:default] = "%m/%d/%Y" # mm/dd/yyyy

# Time
Time::DATE_FORMATS[:default] = "%m/%d/%Y" # mm/dd/yyyy


# FOR QUICK NOTES / GOTCHAS ON TIME IN RAILS
# http://www.elabs.se/blog/36-working-with-time-zones-in-ruby-on-rails

Time::DATE_FORMATS[:month_and_year] = '%B %Y'

# For dates in the format of mm/dd/yyyy
Time::DATE_FORMATS[:americano] = '%m/%d/%Y'
Date::DATE_FORMATS[:americano] = '%m/%d/%Y'

# For dates in the format of mm-dd-yyyy
Time::DATE_FORMATS[:ameridasho] = "%m-%d-%Y"
Date::DATE_FORMATS[:ameridasho] = "%m-%d-%Y"

# For dates in the format of March 12th, 2014
Time::DATE_FORMATS[:amerilongo] = proc { |t| t.strftime("%B #{t.day.ordinalize}, %Y") }
Date::DATE_FORMATS[:amerilongo] = proc { |d| d.strftime("%B #{d.day.ordinalize}, %Y") }

# For goalserve dates like 30.04.2014 (April 30th, 2014)
Time::DATE_FORMATS[:gs_date] = '%d.%m.%Y'
Date::DATE_FORMATS[:gs_date] = '%d.%m.%Y'

# Ex: Thu Jun 05, 2014 at 08:05 PM
Time::DATE_FORMATS[:ameritime] = "%a %b %d, %Y at %I:%M %p"

# Ex: June 5th 08:05 PM
Time::DATE_FORMATS[:ameritimeshort] = proc { |t| t.strftime("%b #{t.day.ordinalize} %I:%M") }

# Ex: 06-05 08:05 PM
Time::DATE_FORMATS[:ameritimeshortest] = proc { |t| t.strftime("%m/%d %I:%M") }

Time::DATE_FORMATS[:filesafe] = "%m-%d-%Y_%H_%M_%S"

Time::DATE_FORMATS[:iso8601_filesafe] = "%Y-%m-%d_%H-%M-%S"

Time::DATE_FORMATS[:hour_only] = "%H"
