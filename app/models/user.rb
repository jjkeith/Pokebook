class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :cards

# Paperclip gem allows users to have a pro pic
  has_attached_file :avatar,
                    :storage => :s3,
                    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => ENV['S3_ACCESS_KEY_ID'],
      :access_key_id => ENV['S3_SECRET_ACCESS_KEY_ID'],
      :secret_access_key => ENV['POKESTASH_BUCKET']}
  end
  
end
