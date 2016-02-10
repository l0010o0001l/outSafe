class Profile < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :about, length: { maximum: 200 }

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  :url => ":s3_domain_url",
  :path => 'profile/:id/avatar/:style_:basename.:extension'

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
