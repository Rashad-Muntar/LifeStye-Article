module ApplicationHelper
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like

      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else

      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def show_sign_out
    out = ''
    out << link_to(link_to('Sign out', destroy_user_session_path, method: :delete)) if user_signed_in?
    out.html_safe
  end

  def show_new_event
    out = ''
    out << link_to(link_to('New Event', new_event_path)) if user_signed_in?
    out.html_safe
  end

  def show_sign_in
    out = ''
    out << link_to(link_to('Sign In', new_user_session_path)) unless user_signed_in?
    out.html_safe
  end

  def show_sign_up
    out = ''
    out << link_to(link_to('Sign Up', new_user_registration_path)) unless user_signed_in?
    out.html_safe
  end

  def show_notice
    content_tag(:div, notice, class: 'notice') unless notice.present?
  end

  def show_alert
    content_tag(:div, alert, class: 'alert') unless alert.present?
  end

  def show_user(user)
    if current_user.friend?(user)
      content_tag(:p, 'Friend of this user')
    elsif current_user.pending_friends.include?(user)
      content_tag(:p, 'Invitation pending')
    elsif current_user.id != user.id && !current_user.pending_friends.include?(user) && !current_user.friend?(user) && !current_user.friend_requests.include?(user)
      content_tag(:div, (render partial: 'users/formfriendship', locals: { user: user }))
    elsif current_user.friend_requests.include?(user)
      out = ''
      out << link_to(link_to('Accept Friend ||', friendship_path(current_user.friendship(user).id), method: 'patch'))
      out << link_to(link_to('Reject Invitation', friendship_path(current_user.friendship(user).id), method: :delete))
      out.html_safe
    end
  end

  def show_post
    content = ''
    user_post = current_user.friends_and_own_posts
    user_post.each do |post|
      content << "<li class='post'>"
      content << link_to(link_to(post.user.name, user_path(post.user), class: 'post-author'))
      content << content_tag(:div, (render partial: 'posts/like', locals: { post: post }))
      content << content_tag(:p, post.content)
      content << content_tag(:div, (render partial: 'comments/comment', collection: post.comments),
                             class: 'post-comments-section')
      content << content_tag(:div, (render partial: 'posts/form', locals: { post: post }))
      content << '</li>'
    end
    content.html_safe
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
end
