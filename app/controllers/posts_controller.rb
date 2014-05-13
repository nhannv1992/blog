class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :set_locale
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @comments = @post.comments.page(params[:page])
  end

  def translate
    @lang = I18n.locale
    flash[:notice] = t(:hello)
  end

  private
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def set_locale
    I18n.locale = params[:lang] || I18n.default_locale
  end
end
