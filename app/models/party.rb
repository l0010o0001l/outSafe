class Party < ActiveRecord::Base
  belongs_to :users

  validates :user_id, presence: true
  validates :title, presence: true
  validates :address, presence: true
  validates :min_age, presence: true
end
