class RibbitsController < ApplicationController

	def index
		@ribbits = Ribbit.all
		@ribbit = Ribbit.new
	end

	def create
		@ribbit = current_user.ribbits.new(ribbit_params)

		if @ribbit.save
			flash[:success] = 'Success'
		else
			flash.now[:error] = 'Error'			
		end
		redirect_to root_path
	end


	private

		def ribbit_params
			params.require(:ribbit).permit(:content)
		end
end
