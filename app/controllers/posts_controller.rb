class PostsController < ApplicationController
    # 文章列表
    def index
        @posts = Post.all
    end
    
    
    def new
        @post = Post.new
    end

    def create
        # @post = Post.new(post_params)
        @post = current_user.posts.build(post_params)
    end
    
    def update
        @post = Post.find(params[:id])
        authorize @post
        if @post.update(post_params)
        redirect_to @post
        else
        render :edit
        end
    end

    def publish
        @post = Post.find(params[:id])
        authorize @post, :update?
        @post.publish!
        redirect_to @post
    end

    private

    def post_params
        clean_params = params.requird(:post).permit(:title, :content, :start_at, :end_at )
    end
end