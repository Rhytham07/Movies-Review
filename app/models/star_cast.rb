class StarCast < ApplicationRecord
  self.table_name = :star_casts
   belongs_to :movie
   belongs_to :cast
   validates :role_name, :name, presence: true
 end
 