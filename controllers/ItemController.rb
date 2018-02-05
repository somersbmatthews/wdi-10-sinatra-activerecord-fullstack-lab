class ItemController < ApplicationController

	before do
		if !session[:logged_in]
			session[:message] = "You must be logged in to do that"
			redirect '/user/login'
		end
	end

	# INDEX route
	get '/' do
		"this is get route in ItemController"
		@items = Item.all
		@items.to_json
		erb :item_index
	end

	# ADD route 
	get '/add' do
		
			@page = "Add Item"
			@action = "/items/add"
			@method = "POST"
			@placeholder = "Enter your item!"
			@value=""
			@buttontext = "Add Item"
			erb :add_item 

	end

	# CREATE route
	post '/add' do
	
		pp params
		"you posted. check your terminal."
		@item = Item.new
		@item.title = params[:title]
		@item.user_id = session[:user_id]
		@item.save

		# hey there's a .to_json method. cool.
		#@item.to_json
		session[:message] = "You added item \##{@item.id}."
		redirect '/items'
	end

	delete '/:id' do
		@item = Item.find params[:id]
		@item.delete
		session[:message] = "You deleted item \##{@item.id}"
		redirect '/items'
	end
	# edit route
	get '/edit/:id' do
		@item = Item.find params[:id]
		@page = "Edit Item #{@item.id}" #why am i using interpolation here?  try with concatenation and see what happens.
		erb :edit_item
	end

	patch '/:id' do
		@Item = Item.find params[:id]
		@item.title = params[:title]
		@item.save
		redirect '/items'
	end

	#session[:message] = "You updated item \##{@item.id}"
end