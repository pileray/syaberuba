class ObjectionsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    comment = Comment.find_by(id: params[:comment_id])
    if current_user.empathy_comments.include?(comment)
      redirect_back(fallback_location: root_path)
    else
      @objection = current_user.objections.build(comment_id: params[:comment_id])
      @objection.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @objection = current_user.objections.find_by(comment_id: params[:comment_id])
    @objection.destroy if @objection
    redirect_back(fallback_location: root_path)
  end
end
