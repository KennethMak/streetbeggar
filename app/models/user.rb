class User < ActiveRecord::Base
	has_many :owned_projects, class_name:'Project'
	has_many :backed_projects, class_name: 'Project'
end
