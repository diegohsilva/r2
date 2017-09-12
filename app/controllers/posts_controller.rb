class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    respond_to :html

    def index
      @posts = Post.all
      respond_with(@posts)
    end

    def show
      respond_with(@post)
    end

    def new
      @post = Post.new
      @post.user_id = current_user.id            
      respond_with(@post)
    end

    def edit
      @post.user_id = current_user.id            
    end

    def create
      @post = Post.new(post_params)
      @post.save
      respond_with @post, :location => posts_path
    end

    def update
      @post.update(post_params)
      respond_with @post, :location => posts_path
    end

    def destroy
      @post.destroy
      
      respond_with @post, :location => posts_path
    end

    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :description, :url_image, :size_image, :key_youtube, :size_video, :user_id)
      end
end
