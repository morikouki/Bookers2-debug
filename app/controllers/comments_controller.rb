class CommentsController < ApplicationController

	before_action :authenticate_user!
  

	def create
		book = Book.find(params[:book_id])
		comment = current_user.comments.new(book_comment_params)
		comment.book_id = book.id
		if comment.save
		   flash[:notice] = "You have created book_comment successfully."
		   redirect_back(fallback_location: root_path)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.comments.find_by(book_id: book.id)
		comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:comment).permit(:book_comment)
	end
end
