class CommentsController < ApplicationController
	#respond_to :html, :xml, :json

	# before_filter :set_headers

	# def set_headers
	#   puts 'CommentsController.set_headers'
	#   if request.headers["HTTP_ORIGIN"]     
	#   # better way check origin
	#   # if request.headers["HTTP_ORIGIN"] && /^https?:\/\/(.*)\.some\.site\.com$/i.match(request.headers["HTTP_ORIGIN"])
	#     headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
	#     headers['Access-Control-Expose-Headers'] = 'ETag'
	#     headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
	#     headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
	#     headers['Access-Control-Max-Age'] = '86400'
	#     headers['Access-Control-Allow-Credentials'] = 'true'
	#   end
	# end 

	def index
		@commentable = find_commentable
		@comments = @commentable.comments
		respond_to do |format|
		    format.html 
		    format.json { render json: @comments }
		end
	end

  def new
    @commentable = find_commentable
    @comment = @commentable.comments.new
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    puts @commentable.inspect
    puts @comment.inspect

    if @comment.save
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
    #params.require(:name, :created_by).permit!
    params.require(:comment).permit(:name, :created_by)
  end

  def context_url(context)
    if Event === context
      event_path(context)
    else
      post_path(context)
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
