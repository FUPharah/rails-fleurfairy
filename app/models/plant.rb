class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  after_validation :geocode, if: :will_save_change_to_city?
  geocoded_by :city
end
