class ItemController < ApplicationController

	# INDEX route
	get '/' do
		"this is get route in ItemController"
	end

	# ADD route 
	get '/add' do
		erb :add_item 
			@page = "Add Item"
			@action = "/items/add"
			@method = "POST"
			@placeholder = "Enter your item!"
			@value=""
			@buttontext = "Add Item"

	end

end