class VotesController < ApplicationController
  before_action :require_user, only: %i[create destroy]

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      redirect_to article_url(params[:article_id]), notice: 'You voted a post.'
    else
      redirect_to articles_path, alert: 'You cannot you hav already voted this post.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to article_url(params[:article_id]), notice: 'You unvoted a article.'
    else
      redirect_to articles_path, alert: 'You cannot unvote this article'
    end
  end
end
