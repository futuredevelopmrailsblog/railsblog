class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @pictureshot = Pictureshot.find(params[:pictureshot_id])
    @comment = @pictureshot.comments.create(comment_params) 
    @comment.user_id = current_user.id if current_user 
    @comment.save!

    redirect_to pictureshot_path(@pictureshot)
  end

  def destroy
    @pictureshot = Pictureshot.find(params[:pictureshot_id])
    @comment = @pictureshot.comments.find(params[:id])
    @comment.destroy
    redirect_to pictureshot_path(@pictureshot)
  end

 private


  def comment_params 
    params.require(:comment).permit(:name, :response)
  end

end
