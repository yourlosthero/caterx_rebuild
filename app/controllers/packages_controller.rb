class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  # GET /packages/1
  # GET /packages/1.json
  def show
    if session[:customer_id].present?
      @package.increment!(:views, 1)
    elsif session[:caterer_id].present? || session[:admin] == "CaterX"
    else
      cookies[:package_id] = params[:id]
      flash[:warning] = 'Log in to view package.'
      redirect_to login_path
    end
  end

  # GET /packages/new
  def new
    if session[:caterer_id].present?
      @package = Package.new
      @agency = Caterer.find(session[:caterer_id])
    else
      flash[:danger] = 'Unauthorized Access, Please Login.'
      redirect_to login_path(:u => 'caterer')
    end
  end

  # GET /packages/1/edit
  def edit
    if session[:caterer_id].present?
      @caterer = Caterer.find(session[:caterer_id])
      if @package.caterer_id != session[:caterer_id]
        redirect_to caterer_path(Caterer.find(session[:caterer_id]).uid)
      end
    else
      flash[:danger] = 'Unauthorized Access, Please Login.'
      redirect_to login_path(:u => 'caterer')
    end
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:name, :guests, :price, :category, :location, :design_amenities, :other_amenities, :policy, :terms, :downpayment, :mode_of_payment, :food, :caterer_id, :views, :appearances, :remember_policy, :remember_terms, :remember_payment)
    end
end
