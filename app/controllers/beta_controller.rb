class BetaController < ApplicationController

	def home
		@events = ['Wedding', 'Debut', 'Birthday - Kids', 'Birthday - Teens', 'Birthday - Adults', 'Birthday - Senior Citizens', 'Baptismal', 'Promenade'] #CHANGE WHEN ADDING CATEGORIES
		@events = @events.sort_by!{ |c| c.downcase }
		@locations = ['Bulacan','Cavite','Laguna','Metro Manila','Tagaytay'] #CHANGE WHEN ADDING LOCATIONS
		cookies.delete(:package_id)
	end

	def results
		@results = Package.all
		@results = @results.where('category LIKE ?', "%" + params[:search][:event] + "%") if params[:search][:event]
		@results = @results.paginate(:page => params[:page], :per_page => 12)
		# EVENTS AND LOCATIONS AVAILABLE
		@events = ['Wedding', 'Debut', 'Birthday - Kids', 'Birthday - Teens', 'Birthday - Adults', 'Birthday - Senior Citizens', 'Baptismal', 'Promenade'] #CHANGE WHEN ADDING CATEGORIES
		@events = @events.sort_by!{ |c| c.downcase }
		@locations = ['Bulacan','Cavite','Laguna','Metro Manila','Tagaytay'] #CHANGE WHEN ADDING LOCATIONS
	end

	def login
		if session[:caterer_id].present? && params[:p].present?
			session[:caterer_id] = nil
			cookies[:package_id] = params[:p]
		else
			if session[:caterer_id].present? || session[:caterer_id].present?
				flash[:danger] = "Logged in already."
				redirect_to beta_path
			end
		end
	end

	def register
		if session[:customer_id].present?
			session[:customer_id] = nil
		elsif session[:caterer_id].present?
			redirect_to caterer_path(Caterer.find(session[:caterer_id]).uid)
		else
		end
	end

	def login_submit
		if Caterer.where(mobile_1: login_params[:mobile]).present?
			@caterer = Caterer.find_by(mobile_1: login_params[:email])
			if login_params[:password] == @caterer.password
				session[:caterer_id] = @caterer.id
				if cookies[:package_id].present?
					redirect_to package_path(cookies[:package_id])
				else
					redirect_to caterer_path(@caterer.uid)
				end
			else
				flash[:danger] = 'Invalid Email, Phone or Password'
				redirect_to login_path(:u => 'caterer')
			end
		else
			flash[:danger] = 'Invalid Email, Phone or Password'
			redirect_to login_path(:u => 'caterer')
		end
	end

	private def login_params
		params.require(:login).permit(:mobile, :password)
	end
end