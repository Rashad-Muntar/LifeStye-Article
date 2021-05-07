module ApplicationHelper

    def show_sign_in
        out = ''
        out << link_to(link_to('Sign In', login_path)) unless logged_in?
        out.html_safe
      end
    
      def show_sign_up
        out = ''
        out << link_to(link_to('Sign up', signup_path)) unless logged_in?
        out.html_safe
      end
    
      def show_sign_out
        out = ''
        out << link_to(link_to('Sign out', signout_path, method: :delete)) if logged_in?
        out.html_safe
      end

    def vote_unvote(article)
        vote = Vote.find_by(article: article, user: current_user)
        if vote
          button_to('unvote!', article_vote_path(id: vote, article_id: article.id), method: :delete)
        else
          button_to('vote!', article_votes_path(id: vote, article_id: article.id))
        end
      end
end
