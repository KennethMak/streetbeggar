class Donation < ActiveRecord::Base
	belongs_to :reward
	belongs_to :backer, class_name:'User'
end
