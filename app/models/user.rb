class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :cards
  validates_uniqueness_of :email, :username
  # has_attached_file :avatar,
  #                   :storage => :s3,
  #                   styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
  #                   url: ":s3_domain_url",
  #                   path: "/:class/:attachment/:id_partition/:style/:filename",
  #                   :s3_region => 'us-west-1',
  #                   :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  #
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  #
  # def s3_credentials
  #   {:bucket => ENV['S3_ACCESS_KEY_ID'],
  #     :access_key_id => ENV['S3_SECRET_ACCESS_KEY_ID'],
  #     :secret_access_key => ENV['POKESTASH_BUCKET']}
  # end

  def add_card(card)
    if self.cards.find_by(id:card.id)
      return card
    else
      self.cards << card
    end
  end

  def destroy_card(card)
    if self.cards.find_by(id:card.id)
        self.cards.delete(card.id)
      end
  end

end
