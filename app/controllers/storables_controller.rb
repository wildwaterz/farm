class StorablesController < ApplicationController

before_action :set_farm
before_action :set_storage
before_action :set_storable, only: [:edit, :update, :show, :destroy]
before_action :require_user
before_action :require_same_user

def index
  @storables = Storable.all
end

def new
   @storable = @storage.storables.new
end

def edit

end

def show
  
end

  def create
    @storable = @storage.storables.new(storable_params)
    if @storable.save
      flash[:notice] = "Object added successfully!!"
      redirect_to farm_storage_path(@farm, @storage)
    else
      render :new
    end
  end
  
  def update
    
    if @storable.update(storable_params)
      flash[:notice] = "Object updated successfully!!"
      redirect_to farm_storage_path(@farm, @storage)
    else
      render :edit
    end
  end
  
  def destroy
    
    @storable.destroy
    flash[:notice] = "Object deleted successfully!!"
    redirect_to farm_storage_path(@farm, @storage)
  end
  
  
private
  
def storable_params
  params.require(:storable).permit(:category, :size, :weight)
end

def set_farm
  @farm = Farm.find(params[:farm_id])
end

def set_storage
  @storage = @farm.storages.find(params[:storage_id])
end

def set_storable
  @storable = @storage.storables.find(params[:id])
end

def require_same_user
  if current_user != @farm.user and !current_user.admin?
    flash[:danger] = "You can only edit your own farms"
    redirect_to farms_path
  end
end

end
