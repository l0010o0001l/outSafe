class Party < ActiveRecord::Base
  belongs_to :users

  geocoded_by :address
  after_validation :geocode

  validates :user_id, presence: true
  validates :title, presence: true
  validates :address, presence: true
  validates :min_age, presence: true

end
