class PostsController < ApplicationController
  before_action :set_class_room_id, only: [:index, :new, :create, ]

  def index
    @posts = @class_room.posts.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = '送信されました'
      redirect_to class_room_posts_path(current_user.class_room.id)
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(class_room_id: params[:class_room_id])
  end

  def set_class_room_id
    @class_room = ClassRoom.find(params[:class_room_id])
  end
end