class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
# rubocop:disable Style/GuardClause, Layout/CommentIndentation, Layout/CommentIndentation, Lint/RedundantCopDisableDirective

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:notice] = 'You must be logged in first'
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user.admin?
      flash[:notice] = 'Only the admin can access this page'
      redirect_to root_path
    end
  end

  # rubocop:enable Style/GuardClause, Layout/CommentIndentation, Layout/CommentIndentation, Lint/RedundantCopDisableDirective
end
