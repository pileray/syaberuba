class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [ :show, :edit, :update, :destroy ]
  
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザ登録を完了しました。ログインフォームよりログインしてください。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :age, :job, :sex, :image, :remove_image, :password, :password_confirmation)
  end
  
end
