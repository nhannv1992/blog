class CommentsController < ApplicationController

  before_action :set_post, only: [:create]

  def edit
  end

  def update
  end

  def create
    if(user_signed_in?)
        user_id = current_user.id
        post_id = @post.id

      @comment = @post.comments.new(message:params[:message], user_id:user_id, post_id:post_id)
      if(@comment.save)

        #send email to author of post
        Notifier.delay.email_author(@comment, @post)

        render json: {status:"true"}
      else
        render json: {status:'false'}
      end
    else
      redirect_to @post, notice: "You must login to post comment"
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
    def comment_params
      params.require(:comment).permit(:message)
    end

end
