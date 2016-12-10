class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_url(post)
    else
      flash[:messages] = post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def show
    @post = Post.find_by(:id => params[:id])
    render :show
  end

  def update
    post = Post.find_by(id: params[:id])
    if current_user.id == post.user_id
      if post.update(post_params)
        redirect_to post_url(post)
      else
        flash[:messages] = post.errors.full_messages
        redirect_to new_post_url
      end
    else
      flash[:messages] = ['You are not the author of this post!']
      redirect_to post_url(post)
    end
  end

  def edit
    @post = Post.find_by(:id => params[:id])
    if current_user.id == @post.user_id
      render :edit
    else
      flash[:messages] = ['You are not the author of this post!']
      redirect_to post_url(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
