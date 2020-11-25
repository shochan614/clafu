class PostsController < ApplicationController
  def index
    @class_room = ClassRoom.find(params[:class_room_id])
    @posts = @class_room.posts.order("created_at DESC")
  end

  def new
    @class_room = ClassRoom.find(params[:class_room_id])
    @post = Post.new
  end

  def create
    @class_room = ClassRoom.find(params[:class_room_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to class_room_posts_path(current_user.class_room.id)
    else
      render :new
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(class_room_id: params[:class_room_id])
  end
end
