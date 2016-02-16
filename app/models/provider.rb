class Provider < ActiveRecord::Base
  # Relationships
  has_many :enrichments, dependent: :destroy
  has_many :field_trips, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :active, -> { where(is_active: true) }

  # Returns true if the provider is marked as active, false otherwise
  def is_active?
    is_active
  end
end
