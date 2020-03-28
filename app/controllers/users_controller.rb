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
    @user = User.find(params[:id])
    @discussions = @user.discussions.page(params[:discussion_page]).per(3)
    @comments = @user.comments.page(params[:comment_page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to @user
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = '退会しました。'
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :age, :job, :sex, :image, :remove_image, :password, :password_confirmation)
  end
  
end
