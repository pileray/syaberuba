class EmpathiesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    comment = Comment.find_by(id: params[:comment_id])
    if current_user.objection_comments.include?(comment)
      redirect_back(fallback_location: root_path)
    else
      @empathy = current_user.empathies.build(comment_id: params[:comment_id])
      @empathy.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @empathy = current_user.empathies.find_by(comment_id: params[:comment_id])
    @empathy.destroy if @empathy
    redirect_back(fallback_location: root_path)
  end
end
