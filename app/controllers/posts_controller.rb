class PostsController < ApplicationController
    before_action :set_post, only:[ :show, :edit, :update, :destroy ]
    # 文章列表
    def index
        @posts = Post.all
    end
    
    
    def new
        @post = Post.new
    end

    def show
        @post = Post.new(post_params)
    end

    def edit
    end

    def create
        @post = Post.new(post_params)
        # @post = current_user.posts.build(post_params)
        # 新增文章時預設角色為creator (如何讓creator預設權限)
        current_user.add_role :creator,@post
        if @post.save
            redirect_to @post, notice: "Post was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def update
        @post = Post.find(params[:id])
        authorize @post
        if @post.update(post_params)
        redirect_to @post, notice: "Post was successfully updated."
        else
        render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_url, notice: "Post was successfully destroyed."
    end

    def publish
        @post = Post.find(params[:id])
        authorize @post, :update?
        @post.publish!
        redirect_to @post
    end

    private

        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:title, :content, :start_at, :end_at )
        end
end