class SubLocation < ActiveRecord::Base
  belongs_to :location
  
  # Validations
  validates_presence_of :name
  validates_presence_of :location
  #validates_presence_of :address_line_one
  #validates_presence_of :city
  #validates_presence_of :state
  #validates_presence_of :zip
  #validates_presence_of :phone
  # Scopes
  scope :alphabetical, -> { order("name") }
  
end
