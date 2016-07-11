class PostsController < ApplicationController
  include SessionsHelper

  def new
    @post = Post.new
  end

  def create
    if logged_in?
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = "Post created!"
        redirect_to root_url
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if logged_in?
      if current_user == @post.user
        @post.destroy
        redirect_to root_url
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
