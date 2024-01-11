class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :movies, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ADMIN_EMAILS = ['shubham@gmail.com']

  def admin?
    ADMIN_EMAILS.include?(self.email)
  end
end
