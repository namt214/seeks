class UsersController < ApplicationController
  def new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end
  def edit
    @user =User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name], email: params[:user][:email])
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil
    redirect_to '/users/new'
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
