class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index

  end

  def new
    @group = Group.find(params[:group_id])

    unless @group.members.include?current_user
      redirect_to group_path(@group),alert: "You have no permission."
    end

    @post = Post.new
  end

  def create

    @group = Group.find(params[:group_id])
    unless @group.members.include?current_user
      redirect_to root_path,alert: "You have no permission."
    end

    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to account_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)

  end
end
