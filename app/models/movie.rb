class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :picture
  belongs_to :user
  has_many :star_cast
 
  
end
