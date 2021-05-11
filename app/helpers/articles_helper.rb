module ArticlesHelper
  def vote_unvote(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      button_to('unvote!', article_vote_path(id: vote, article_id: article.id), method: :delete, class: 'vote')
    else
      button_to('vote!', article_votes_path(id: vote, article_id: article.id), class: 'vote')
    end
  end
end
