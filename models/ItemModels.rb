class Item < ActiveRecord::Base

	 	post '/add' do

	  		pp params

	  		# This apparently adds things with active record
			@item = Item.new
			@item.title = params[:title]
			@item.user_id = 1 # for now
			@item.save

			# hey there's a .to_json method. cool.
			@item.to_json

		end

end 