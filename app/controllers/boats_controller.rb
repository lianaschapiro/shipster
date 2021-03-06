class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    @user = current_user
  end

  def show
    @boat = Boat.find(params[:id])
    @job = Job.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @user = current_user
    @boat = current_user.boats.build(boat_params)
    if @boat.save
      flash[:notice] = "Boat created"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Unable to create boat"
      render 'users/show'
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    if @boat.save
      flash[:notice] = "Boat details changed"
    else
      flash[:notice] = "Unable to edit boat details"
      render 'edit'
    end
  end

  def destroy
    @boat = Boat.find(params[:id])
    if @boat.destroy
      flash[:notice] = "Boat deleted"
    else
      flash[:notice] = "Unable to delete boat"
    end
    redirect_to user_path(current_user)
  end

   private
    def boat_params
      params.require(:boat).permit(:name, :location, :containermax, :avatar)
    end
end
