class World < ApplicationRecord
  ROUTER_REGEX = /[a-z0-9]{4,}[\.\-]?[a-z0-9]+/i
  URL_SUFFIX_REGEX = /[a-z0-9]{4,}[\.\-]?[a-z0-9]+$/i

  belongs_to :user

  has_many :travelings
  has_many :cities, through: :travelings

  validate :validate_url_suffix, on: :update
  before_create :assign_url_suffix

  private

  def assign_url_suffix; self.url_suffix = generate_random_url_suffix end

  def generate_random_url_suffix
    loop do
      url_suffix = SecureRandom.urlsafe_base64(6)
      return url_suffix if World.where(url_suffix: url_suffix).blank?
    end
  end

  def validate_url_suffix
    if url_suffix_changed?
      if !url_suffix.match?(URL_SUFFIX_REGEX) or World.where(url_suffix: url_suffix).exists?
        raise Exceptions::DefaultError, "Unavailable suffix format"
      end
    end
  end

end
