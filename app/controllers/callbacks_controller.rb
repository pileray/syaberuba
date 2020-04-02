class CallbacksController < ApplicationController
  before_action :auth_set

  def new_or_create
    if @user
      session[:user_id] = @user.id
      flash[:success] = 'ログインしました。'
      redirect_to root_url
    else
      @user = User.new(provider: @provider, uid: @uid, name: @name, email: @email, remote_image_url: @image)
      render 'users/new'
    end
  end
  
  private
  
  def auth_set
    auth = request.env['omniauth.auth']
    @provider = auth[:provider]
    @uid = auth[:uid]
    @name = auth[:info][:name]
    @email = auth[:info][:email]
    @image = auth[:info][:image]
    @user = User.find_by(provider: @provider, uid: @uid)
  end
    
end
