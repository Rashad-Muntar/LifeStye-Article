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

      def bookmark(article)
        bookmark = Bookmark.find_by(article: article, user: current_user)
        if bookmark
          button_to('unbook!', article_bookmark_path(id: bookmark, article_id: article.id), method: :delete)
        else
          button_to('bookmark!', article_bookmarks_path(id: bookmark, article_id: article.id))
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
        content << "<div class='card bg-dark text-white header_image'>"
        if heighest.image.attached?
          content << image_tag(heighest.image, class: 'card-img main-img')
        end
        content << "<div class='card-img-overlay header-img-content'>"
            content << content_tag(:p, heighest.title, class: 'card-title head-img-title title')
            content << content_tag(:p, heighest.text.truncate(100), class: 'card-text')
            content << '</div>'
          content << '</div>'
        content.html_safe
      end

     def show_featured
    content = ''
    @categories.each do |category|
      content << "<div class='card bg-dark text-white '>"
      content << image_tag(category.articles.last.image, class: 'cat-img')
      content << "<div class='card-img-overlay'>"
      content << link_to(category.name, category_path(category), class: 'card-title cat-img-title')
      content << content_tag(:p, category.articles.last.title, class: 'card-text cat-article-title')
      content << '</div>'
      content << '</div>'
    end
    content.html_safe
  end

  def nav_category
    content = ""
    @categories.each do |category|
       content << link_to(category.name, category_path(category)) 
    end
    content.html_safe
  end

  def cat_cards
    content = ''
    @category.articles.each_with_index do |article, index|
      if index.even? && index != 0
        content << "<div class='home-cat-card'>"
        content << "<div>"
         content << image_tag(article.image, class: 'cat-img')
        content << '</div>'
        content << "<div class='content'>"
          content << content_tag(:p, @category.name, class: 'card-title home-cat-title' )
          content << link_to(article.title, article_path(article), class: 'card-title')
          content << content_tag(:p, article.text.truncate(100), class: 'card-text')
          content << content_tag(:small, "Read more", class: 'card-text')
          content << content_tag(:small, time_ago_in_words(article.created_at), class: 'card-text')
        content << '</div>'
      content << '</div>'
      else
        content << "<div class='home-cat-card'>"
        content << "<div class='content'>"
          content << content_tag(:p, @category.name, class: 'card-title home-cat-title' )
          content << link_to(article.title, article_path(article), class: 'card-title')
          content << content_tag(:p, article.text.truncate(100), class: 'card-text')
          content << content_tag(:small, "Read more", class: 'card-text')
          content << content_tag(:small, time_ago_in_words(article.created_at), class: 'card-text')
        content << '</div>'
        content << "<div>"
         content << image_tag(article.image, class: 'cat-img')
        content << '</div>'
      content << '</div>'
      end
    end
    content.html_safe
  end

end
