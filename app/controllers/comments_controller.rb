class CommentsController < ApplicationController
  def new
    @product = Product.new
    @worknest_comment = @worknest.worknest_comments.new

  end
  def create
    @hostel = Hostel.find(params[:hostel_id])
    @comment = @hostel.comments.new(comment_params)
    @comment.save!
    if @comment.save
      redirect_to hostel_path(@hostel)
    else
      render 'new'  
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :comment)
  end
end
