class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :cards

# Paperclip gem allows users to have a pro pic
  has_attached_file :avatar,
                    :storage => :s3,
                    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def s3_credentials
    {:bucket => "boomchakalaka", :access_key_id => "AKIAJJ3HAXLGNISVV6GA", :secret_access_key => "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"}
  end
end


#
#
# Access Key ID: AKIAJJ3HAXLGNISVV6GA
# Secret Access Key: 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
#
# Bucket Name:
# boomchakalaka
