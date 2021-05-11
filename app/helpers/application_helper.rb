module ApplicationHelper
# rubocop:disable Style/GuardClause, Layout/CommentIndentation, Layout/CommentIndentation, Lint/RedundantCopDisableDirective

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

  def show_notice
    content = ''
    if notice
    content << "<div class='alert alert-success' role='alert'>"
     content << content_tag(:p, notice, class:"notice")
     content << "</div>"
    end
    content.html_safe
  end

  def vote_unvote(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      button_to('unvote!', article_vote_path(id: vote, article_id: article.id), method: :delete, class: 'vote')
    else
      button_to('vote!', article_votes_path(id: vote, article_id: article.id), class: 'vote')
    end
  end

  def bookmark(article)
    bookmark = Bookmark.find_by(article: article, user: current_user)
    if bookmark
      button_to('unbook!', article_bookmark_path(id: bookmark, article_id: article.id), method: :delete, class: 'vote')
    else
      button_to('bookmark!', article_bookmarks_path(id: bookmark, article_id: article.id), class: 'vote')
    end
  end

  def show_current_user
    content = ''
    if current_user
     content << content_tag(:span, current_user.name)
    end
    content.html_safe
  end

  def header_article_show
    content = ''
    vote_checker = 0
    heighest = ''
    @featured.each do |article|
      if (article.votes).exists? 
        if article.votes.length > vote_checker
          vote_checker = article.votes.count
          heighest = article
        end
      end
    end
    content << "<div class='card bg-dark text-white header_image'>"
    content << image_tag(heighest.image, class: 'card-img main-img') if heighest.image.attached?
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
    content = ''
    @categories.each do |category|
      content << link_to(category.name, category_path(category))
    end
    content.html_safe
  end

  def show_edit_delete
    content = ''
    if logged_in? && current_user.id == @article.user_id
      content << link_to('edit', edit_article_path(@article), class: 'vote edit')
      content << button_to('delete', article_path(@article), method: :delete, data: { confirm: 'Are you sure?' },
                                                             class: 'vote')
    end
    content.html_safe
  end

  def show_category_articles
    content = ''
    @category_articles.each_with_index do |article, index|
      content << "<div>"
        content << image_tag(article.image, class:'article-img') if index.even?
        content << "<div class='content'>"
          content << content_tag(:p, @category.name, class:"theme-color")
          content << link_to(article.title, article_path(article))
          content <<  content_tag(:p, "Read more")
          content << content_tag(:p, time_ago_in_words(article.created_at))
        content << "</div>"
        content << image_tag(article.image, class: 'article-img') if index.odd?
      content << "</div>"
    end
    content.html_safe
  end

  def odd_article_image(index, article)
    article_image = ''
    article_image << image_tag(article.image, class: 'article-img')
    article_image.html_safe if index.odd?
  end

  def even_article_image(index, article)
    article_image = ''
    article_image << image_tag(article.image, class: 'article-img')
    article_image.html_safe if index.even?
  end

  def show_article_mg
    content = ''
    if @article.image.attached?
      content << image_tag(@article.image)
    end
    content.html_safe
  end

  # rubocop:enable Style/GuardClause, Layout/CommentIndentation, Layout/CommentIndentation, Lint/RedundantCopDisableDirective
end
