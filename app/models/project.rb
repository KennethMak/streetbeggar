class Project < ActiveRecord::Base
	has_many :rewards
	has_many :donations, through: :rewards
	has_many :backers, through: :donations, class_name:'User'
	belongs_to :creator, class_name:'User'

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	accepts_nested_attributes_for :rewards
end
