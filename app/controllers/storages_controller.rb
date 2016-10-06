class StoragesController < ApplicationController

 before_action :set_farm
 before_action :set_storage, only: [:edit, :update, :show, :destroy]
 before_action :require_user
 before_action :require_same_user

def index
  @storages = Storage.all
end

def new
 
  @storage = @farm.storages.new

end

def edit

end

def show
  
end

  def create
    @storage = @farm.storages.new(storage_params)
    if @storage.save
      flash[:notice] = "Storage created successfully!!"
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end
  
  def update
    
    if @storage.update(storage_params)
      flash[:notice] = "Storage updated successfully!!"
      redirect_to farm_path(@farm)
    else
      render :edit
    end
  end
  
  def destroy
    
    @storage.destroy
    flash[:notice] = "Storage deleted successfully!!"
    redirect_to farm_path(@farm)
  end
  
  
private
  
def storage_params
  params.require(:storage).permit(:category)
end

def set_farm
  @farm = Farm.find(params[:farm_id])
end

def set_storage
  @storage = @farm.storages.find(params[:id])
end

  def require_same_user
    if current_user != @farm.user and !current_user.admin?
      flash[:danger] = "You can only edit your own farms"
      redirect_to farms_path
    end
  end
  
end

