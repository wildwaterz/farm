class FarmsController < ApplicationController
  before_action :set_farm, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index]
  before_action :require_same_user, only: [:edit, :update, :destroy, :show]

  
  def index
    @farms = Farm.all
  end
  
  def new
    @farm = Farm.new
  end
  
  def edit
  
  end
  
  def show
  
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.user = current_user
    if @farm.save
      flash[:notice] = "Farm created successfully!!"
      redirect_to farms_path
    else
      render :new
    end
  end
  
  def update
    
    if @farm.update(farm_params)
      flash[:notice] = "Farm updated successfully!!"
      redirect_to farms_path
    else
      render :edit
    end
  end
  
  def destroy
    
    @farm.destroy
    flash[:notice] = "Farm deleted successfully!!"
    redirect_to farms_path
  end
  
  
  private
  
  def farm_params
    params.require(:farm).permit(:name)
  end
  
  def set_farm
    @farm = Farm.find(params[:id])
  end
  
  def require_same_user
    if current_user != @farm.user and !current_user.admin?
      flash[:danger] = "You can only edit your own farms"
      redirect_to farms_path
    end
  end

end
