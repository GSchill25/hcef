module Contexts
  module UserContexts
  	def create_users
  		@user1 = FactoryGirl.create(:user, username: "admin", password: "admin", password_confirmation: "admin", role: "admin", active: true)
  		@user2 = FactoryGirl.create(:user, username: "instructor1", password: "instructor1", password_confirmation: "instructor1", role: "instructor", active: true)
  		@user3 = FactoryGirl.create(:user, username: "instructor2", password: "instructor2", password_confirmation: "instructor2", role: "instructor", active: true)
  		@user4 = FactoryGirl.create(:user, username: "guardian", password: "guardian", password_confirmation: "guardian", role: "guardian", active: true)
  	  @user5 = FactoryGirl.create(:user, username: "instructor3", password: "instructor3", password_confirmation: "instructor3", role: "admin", active: false)
    end

  	def delete_users
  		@user1.delete
  		@user2.delete
  		@user3.delete
  		@user4.delete
      @user5.delete
  	end
  end
end