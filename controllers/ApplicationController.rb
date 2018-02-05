class ApplicationController < Sinatra::Base

		require 'bundler'
		Bundler.require()

		get '/' do
			"The server is armed and operational."
		end

end