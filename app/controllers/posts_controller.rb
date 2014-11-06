class PostsController < ApplicationController

def index
 if current_user
   @posts = Post.all
 else
   redirect_to log_in_path
 end
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
