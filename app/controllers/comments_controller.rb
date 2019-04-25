class CommentsController < ApplicationController
	before_action :set_comment, only: [:destroy, :edit, :update]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to request.referrer
  end

  def update
    if current_paciente != nil
      user = current_paciente
    end

    if current_nutriologo != nil
      user = current_nutriologo
    end

    if @comment.created_by == user
      if @comment.update(comment_params)
  			redirect_to comments_path
  		else
  			render 'edit'
  		end
    end
  end

  def create
    @comment= Comment.new(comment_params)

    if current_paciente != nil
      user = current_paciente
    end

    if current_nutriologo != nil
      user = current_nutriologo
    end

    @comment.created_by = user

    if @comment.save
      redirect_to comments_path
		else
			render 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :description)
    end
end