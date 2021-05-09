class BookmarksController < ApplicationController
    before_action :require_user, only: %i[create destroy]
    
      def create
        @bookmark = current_user.bookmarks.new(article_id: params[:article_id])
        if @bookmark.save
          redirect_to article_url(params[:article_id]), notice: 'You bookmarked this article.'
        else
          redirect_to articles_path, alert: 'You cannot bookmark this article, you hav already bookmarked this'
        end
      end
    
      def destroy
        bookmark = Bookmark.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
        if bookmark
          bookmark.destroy
          redirect_to article_url(params[:article_id]), notice: 'You removed this article from your bookmark.'
        else
          redirect_to articles_path, alert: 'You cannot unvote this article'
        end
      end
  
      
    end