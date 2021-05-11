module CategoriesHelper
  def header_article_show
    content = ''
    vote_checker = 0
    heighest = ''
    @featured.each do |article|
      if article.votes.length > vote_checker
        vote_checker = article.votes.count
        heighest = article
      end
    end
    content << "<div class='card bg-dark text-white header_image'>"
    unless heighest.blank?
      content << image_tag(heighest.image, class: 'card-img main-img') if heighest.image.attached?
      content << "<div class='card-img-overlay header-img-content'>"
      content << content_tag(:p, heighest.title, class: 'card-title head-img-title title')
      content << content_tag(:p, heighest.text.truncate(100), class: 'card-text')
      content << '</div>'
    end
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

  def show_category_articles
    content = ''
    @category_articles.each_with_index do |article, index|
      content << '<div>'
      content << image_tag(article.image, class: 'article-img') if index.even?
      content << "<div class='content'>"
      content << content_tag(:p, @category.name, class: 'theme-color')
      content << link_to(article.title, article_path(article))
      content << content_tag(:p, 'Read more')
      content << content_tag(:p, time_ago_in_words(article.created_at))
      content << '</div>'
      content << image_tag(article.image, class: 'article-img') if index.odd?
      content << '</div>'
    end
    content.html_safe
  end
end
