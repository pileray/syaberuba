class CommentsController < ApplicationController
  before_action :require_user_logged_in, only: [ :create, :destroy ]
  
  def create
    @comment = current_user.comments.build( discussion_id: params[:discussion_id] )
    @show_discussion = Discussion.find(params[:discussion_id])
    @discussion = Discussion.where(id: params[:discussion_id]).page(params[:page])
    if @comment.update( comment_params )
      flash[:success] = 'SyaberuBaに発言しました！'
      redirect_to @show_discussion
    else
      flash.now[:danger] = 'SyaberuBaへの発言に失敗しました。'
      render 'discussions/comment'
    end
  end

  def destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit( :opinion, :learning )
  end
end
