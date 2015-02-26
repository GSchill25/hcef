class Provider < ActiveRecord::Base
  # Relationships
  belongs_to :enrichment

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false}

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :active, ->       { where(active: true) }
  scope :inactive, ->     { where(active: false) }
end
