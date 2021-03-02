class UserController < 

  def index
    @users = User.all.select(:name, :city, :age, :id)
  end

  #before_action :status_check
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(require_params)
    if @user.save
      render json: @user
    else
      render new
    end
  end

  def update
    puts require_params
    @user = User.update(params[:id],require_params);
    render json: @user
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

end
