class PostsController < ApplicationController

def index
 if current_user
   @posts = Post.all.order('created_at')
 else
   redirect_to log_in_path
 end
end

def show
  @post = Post.find(params[:id])
  @comments = @post.comments.all.order('created_at')
end

def create
  post = current_user.posts.create(post_params)
  post.save
  redirect_to posts_path
end


def destroy
  post = Post.find(params[:id])
  post.destroy
  redirect_to posts_path
end


private
def post_params
    params.require(:post).permit(:title, :text)
end


end
