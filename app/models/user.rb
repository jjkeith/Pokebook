class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :cards

# Paperclip gem allows users to have a pro pic
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
