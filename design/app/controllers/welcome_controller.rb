class WelcomeController < ApplicationController
	
	def index
		#Executes The index pages for the site	
	end
	def user
		respond_to do|format|
			format.html
			format.js
		end	
	end	
end
