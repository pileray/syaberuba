class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      flash[:danger] = "投稿・コメント・ユーザー閲覧はログイン後可能です。"
      redirect_to login_url
    end
  end
end
