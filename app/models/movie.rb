class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :picture
  belongs_to :user
  
  validates :title, presence: true
  validates :description, presence: true
  validates :rating,presence:true, numericality: {only_integer:true, greater_then_or_eqal_to: 5}
  
end
