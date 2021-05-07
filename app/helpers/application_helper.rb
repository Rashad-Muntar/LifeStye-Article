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


      def header_article_show
        content = ''
        voteChecker = 0
        heighest = ''
        @featured.each do |article|
          if article.votes.length > voteChecker
            voteChecker = article.votes.count
            heighest = article
          end
        end

        content << "<div class='header-img-wrapper'>"
        if heighest.image.attached?
          content << image_tag(heighest.image, class: 'header-img')
        end
            content << content_tag(:span, heighest.category.name, class: 'img-cat')
            content << content_tag(:span, heighest.title, class: 'heighest.title')
          content << '</div>'
        content.html_safe
      end

end
