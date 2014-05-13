class BackendController < ApplicationController
	before_action :check_login, :set_user
	before_action :set_post, only: [:edit_post, :update_post, :destroy_post]
	def manage_posts
		@posts = @user.posts
	end

	def new_post
		@post = @user.posts.new
	end

	def create_post
		@post = @user.posts.new(post_params)

		if(@post.save)
			redirect_to post_manage_path, notice: "Post added successfully"
		end
	end

	def edit_post

	end

	def update_post
		if(@post.update(post_params))
			redirect_to post_manage_path, notice: "Post updated successfully"
		end
	end

	def destroy_post
	end

	private
		def check_login
			if(!user_signed_in?)
				redirect_to new_user_session_path, notice: "You must login to do this action"
			else

			end
		end

		def set_user
			@user = current_user
		end

		def set_post
			@post = current_user.posts.find(params[:post_id])
		end

		def post_params
			params.require(:post).permit(:title, :body, :excerpt)
		end
end
