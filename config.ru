require 'sinatra/base'
require 'sinatra/activerecord'

require './controllers/ApplicationController'
require './controllers/ItemController'
require './controllers/UserController'

require './models/ItemModel'
require './models/UserModel'

map('/') {
	run ApplicationController
}
map('/items') { 
	run ItemController
}

map('/user'){
	run UserController
}



