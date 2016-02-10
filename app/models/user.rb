class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessor :current_password

  after_create :create_profile

  has_one :profile, dependent: :destroy
  has_many :parties

  accepts_nested_attributes_for :profile, allow_destroy: true
end
