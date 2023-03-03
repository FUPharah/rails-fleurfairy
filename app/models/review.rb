class Review < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  validates :content, presence: true, length: {minimum: 10}
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
