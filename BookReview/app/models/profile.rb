class Profile < ApplicationRecord
	belongs_to :user
	has_many :books


  has_attached_file :image, styles: { profile_index: "250x350>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def full_name
  	"#{first_name} #{last_name}"
  end
end
