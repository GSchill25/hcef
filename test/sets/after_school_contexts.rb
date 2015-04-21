module Contexts
  module AfterSchoolContexts
  	def create_after_schools
      @as1 = FactoryGirl.create(:after_school, date: Date.today, time_in: DateTime.now, time_out: DateTime.now, total_hours: 30, homework_time: 10, literacy_time: 10, technology_time: 5, reading_specialist_time: 5, goal: "finish homework", child: @child1, program: @program1)
      @as2 = FactoryGirl.create(:after_school, date: Date.today, time_in: DateTime.now, time_out: DateTime.now, total_hours: 6, homework_time: 2, literacy_time: 2, technology_time: 1, reading_specialist_time: 1, goal: "finish homework", child: @child2, program: @program1)
      @as3 = FactoryGirl.create(:after_school, date: 10.days.from_now, time_in: DateTime.now, time_out: DateTime.now, total_hours: 0, homework_time: 0, literacy_time: 0, technology_time: 0, reading_specialist_time: 0, goal: "finish homework", child: @child3, program: @program5)
    end

    def delete_after_schools
      @as1.delete
      @as2.delete
      @as3.delete
    end
  end
end