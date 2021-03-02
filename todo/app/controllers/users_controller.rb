class UsersController < ApplicationController

  #before_action :status_check
  #protect_from_forgery with: :null_session
  
  def index
    @users = User.all.select(:name, :city, :age, :id)
  end


  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  #before_action :status_check
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(require_params)
    if @user.save
      return redirect_to users_path
    else
      render new
    end
  end

  def update
    puts require_params
    @user = User.update(params[:id],require_params);
    return redirect_to users_path
  end

  def status_check
    if(params[:status] == nil && params[:status] != 'true')
      return render json: "Unauthenticated user"
    end
  end

  def destroy
    @user = User.find(params[:id]);
    @user.destroy
    return redirect_to users_path
  end

  def custom_methods
    render json: "custom_methods call"
  end

  private 
  def require_params
    params.require(:user).permit(:name, :city, :age)
  end
end
