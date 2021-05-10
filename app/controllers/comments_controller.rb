class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

      if @comment.save
          redirect_to @article, notice: 'Comment was successfully created.'
      else
        redirect_to @article, notice: 'Please fill all fields'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :name)
  end
end
