class DiscussionsController < ApplicationController
  before_action :require_user_logged_in, only: [ :new, :create, :edit, :update, :destroy, :comment ]
  
  def index
    @discussions = Discussion.all.order(id: :desc).page(params[:discussion_page]).per(9)
  end

  def show
    @discussion = Discussion.where(id: params[:id]).page(params[:discussion_page])
    @comments = Comment.where(discussion_id: params[:id]).order(id: :desc).page(params[:comment_page]).per(4)
  end

  def new
    @discussion = current_user.discussions.build
  end

  def create
    @discussion = current_user.discussions.build( discussion_params )
    if @discussion.save
      flash[:success] = "SyaberuBaを作成しました！"
      redirect_to @discussion
    else
      flash.now[:danger] = "SyaberuBaの作成に失敗しました。"
      render :new
    end
  end

  def edit
    @show_discussion = Discussion.where(id: params[:id]).page(params[:discussion_page])
    @discussion = Discussion.find_by(id: params[:id])
  end

  def update
    @discussion = Discussion.find_by(id: params[:id])
    if @discussion.update( discussion_params )
      @discussion.update( assent: 1 )
      flash[:success] = 'SyaberuBaに納得しました！'
      redirect_to @discussion
    else
      flash.now[:danger] = 'SyaberuBaの納得に失敗しました。'
      render :edit
    end
  end

  def destroy
    @discussion = current_user.discussions.find_by(id: params[:id])
    if !!@discussion
      @discussion.destroy
      flash[:success] = 'SyaberuBaを削除しました。'
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
  def comment
    @comment = current_user.comments.build
    @discussion = Discussion.where(id: params[:id]).page(params[:discussion_page])
  end
  
  private
  
  def discussion_params
    params.require(:discussion).permit( :title, :content, :assent_comment )
  end
  
end
