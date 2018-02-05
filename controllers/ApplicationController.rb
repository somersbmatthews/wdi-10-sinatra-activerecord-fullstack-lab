class ApplicationController < Sinatra::Base

		require 'bundler'
		Bundler.require()

			enable :sessions

			ActiveRecord::Base.establish_connection(
		 		:adapter => 'postgresql', 
		 		:database => 'item'
			)

			use Rack::MethodOverride

			set :method_override, true	

		set :views, File.expand_path('../views', File.dirname(__FILE__))
		set :public_dir, File.expand_path('../public', File.dirname(__FILE__))

		get '/' do
			@page = "hello"
			erb :hello

		end

		get '/*' do
			erb :not_found
		end


end