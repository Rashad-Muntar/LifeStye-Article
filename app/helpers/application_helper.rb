module ApplicationHelper
# rubocop:disable Style/GuardClause, Layout/CommentIndentation, Metrics/ModuleLength, Layout/CommentIndentation, Lint/RedundantCopDisableDirective

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
      content << content_tag(:p, notice, class: 'notice')
      content << '</div>'
    end
    content.html_safe
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
    content << content_tag(:span, current_user.name) if current_user
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
    content << image_tag(@article.image) if @article.image.attached?
    content.html_safe
  end

  def new_form_error(item)
    content = ''
    if item.errors.any?
      content << "<div id='error_explanation'>"
      content << '<ul>'
      item.errors.each do |error|
        content << content_tag(:li, error.full_message, class: 'error')
      end
      content << '</ul>'
      content << '</div>'
    end
    content.html_safe
  end

  # rubocop:enable Style/GuardClause, Layout/CommentIndentation, Metrics/ModuleLength, Layout/CommentIndentation, Lint/RedundantCopDisableDirective
end
