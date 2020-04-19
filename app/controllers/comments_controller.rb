class CommentsController < ApplicationController
    before_action :set_post
    def new
        @comment= @post.comments.new
    end

    def create
        @comment = @post.comments.new(comment_params)
        if @comment.save
            redirect_to @post
        end
    end

    def edit
        @comment = @post.comments.find(params[:id])
    end
    
    def update
        @comment = @post.comments.find(params[:id])
        @comment.update(comment_params)
        redirect_to @post
    end
    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to @post
      end
    private
    def comment_params
        params.require(:comment).permit(:username, :body)
    end
    def set_post
        @post = Post.find(params[:post_id])
    end
end
