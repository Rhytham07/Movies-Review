class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :picture

  validates :title, presence: true
  validates :description, presence: true
end
