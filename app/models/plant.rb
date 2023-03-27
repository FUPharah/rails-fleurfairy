class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :title, presence: true
  validates :price, presence: true
  validates :city, presence: true
  after_validation :geocode, if: :will_save_change_to_city?
  geocoded_by :city
end
