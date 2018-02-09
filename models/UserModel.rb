class User < ActiveRecord::Base
	has_secure_password # ridiculous
	
	has_many :items # add this
end