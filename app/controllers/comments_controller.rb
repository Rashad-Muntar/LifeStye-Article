class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to @article, notice: 'Comment was successfully created.'
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :name)
  end
end
