class CommentsController < ApplicationController
  def new
    @commentable = find_commentable
    @comment = @commentable.comments.new
  end

  def create
    @commentable = find_commentable
    @commentcomment = @commentable.comments.new(comment_params)

    if @commentcomment.save
      redirect_to context_url(find_commentable), notice: "The comment has been successfully created."
    end
  end

  def edit
    @commentable = find_commentable
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @commentable = find_commentable
    @comment = @find_commentable.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to context_url(find_commentable), notice: "The comment has been updated"
    end
  end

private
  def comment_params
    params.require(:comment, :created_by).permit!
  end

  def context_url(context)
    if Event === context
      events_path(context)
    else
      posts_path(context)
    end
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
