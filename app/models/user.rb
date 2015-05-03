class User < ActiveRecord::Base

    has_secure_password

    #relationships
    belongs_to :instructor

	  validates :username, presence: true, uniqueness: {case_sensitive: false}
    validates :role, presence: true, inclusion: { in: %w[admin instructor guardian], message: "is not a recognized role in system" }
    validates_presence_of :password, on: :create 
    validates_presence_of :password_confirmation, on: :create 
    validates_confirmation_of :password, message: "does not match"
    validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true


    #authentication of user
	  def self.authenticate(login,password)
      find_by_username(login).try(:authenticate, password)
    end

    #there are currently two roles in the system
    #instructor and service provider has exact same roles
  	ROLES = [['admin', :admin],['instructor', :instructor], ['service provider', :instructor]]

    def role?(authorized_role)
      return false if role.nil?
      role.downcase.to_sym == authorized_role
    end

end
