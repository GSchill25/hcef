module Contexts
  module LocationContexts
    def create_locations
      # assumes create_curriculums prior
      @CMU = FactoryGirl.create(:location, name: "CMU", address_line_one: "5000 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557777")
      @UPitt = FactoryGirl.create(:location, name: "UPitt", address_line_one: "4200 Fifth Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125551111")
    end

    def delete_locations
      @CMU.delete
      @UPitt.delete
    end
  end
end