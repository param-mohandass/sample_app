class MicropostsController < ApplicationController

	before_filter :signed_in_user
	before_filter :correct_user,   only: :destroy

	def create
		@micropost = current_user.microposts.build(params[:micropost])
	    if @micropost.save
	      flash[:success] = "Micropost created!"
	      redirect_to root_url
	    else
	      @feed_items = []	
	      render 'static_pages/home'
	    end
	end

	def destroy
		@micropost.destroy

		respond_to do |format|
			format.html { redirect_to root_url }  
    		format.js
		end
	end


	private

	    def correct_user
	      @micropost = current_user.microposts.find_by_id(params[:id])
	      redirect_to root_url if @micropost.nil?
	    end

end
