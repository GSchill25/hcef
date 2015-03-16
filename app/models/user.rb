class User < ActiveRecord::Base

    has_secure_password

    has_one :instructor
    has_one :guardian
    #does this work?

	  validates :username, presence: true, uniqueness: {case_sensitive: false}
    validates :role, presence: true, inclusion: { in: %w[admin instructor guardian], message: "is not a recognized role in system" }
    validates_presence_of :password, on: :create 
    validates_presence_of :password_confirmation, on: :create 
    validates_confirmation_of :password, message: "does not match"
    validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

	private

	def self.authenticate(login,password)
      find_by_username(login).try(:authenticate, password)
    end

  	ROLES = ['admin', 'instructor', 'guardian']

    def role?(authorized_role)
      return false if role.nil?
      role.to_sym == authorized_role
    end

end
