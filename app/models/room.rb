class Room < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}

  belongs_to :user
  has_many :photos
  has_many :reservations

  has_many :guest_reviews
  has_many :calendars

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  attribute :start_time, :string, default: 6
  attribute :end_time, :string, default: 23

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

  def cover_photo_second(size)
    if self.photos.length > 1
      self.photos[1].image.url(size)
    else
      "blank.jpg"
    end
  end

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
