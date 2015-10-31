class FormsController < ApplicationController
	def new
		@form = Formtrial.new
	end

	def create
		@f = Formtrial.new(forms_param)
		if @f.save
	  		redirect_to(:controller=>'forms',:action=>'show',:id=>@f) 
		else
			render  'new'
		end
	end
	def update
		@form = Formtrial.find(params[:id])
		if @form.update(forms_param)
			redirect_to(:controller=>'forms',:action=>'show',:id=>@form)
		else
			redirect_to(:controller=>'forms',:action=>'edit',:id=>@form)
		end
	end
	def show
		@form = Formtrial.find(params[:id])
	end
	def edit
		@form = Formtrial.find(params[:id])
	end
	

	private
		def forms_param
			params.require(:form).permit(:name,:age ,:email)
		end
end
