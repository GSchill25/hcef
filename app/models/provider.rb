class Provider < ActiveRecord::Base
  # Relationships
  has_many :enrichments
  has_many :field_trips

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false}

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :active, ->       { where(active: true) }
  scope :inactive, ->     { where(active: false) }
end
