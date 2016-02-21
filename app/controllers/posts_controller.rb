class PostsController < InheritedResources::Base

	before_filter :set_headers

	# def index
	#   puts "Do nothing."
	#   render nothing: true
	# end

	def set_headers
	  puts 'PostsController.set_headers'
	  if request.headers["HTTP_ORIGIN"]     
	  # better way check origin
	  # if request.headers["HTTP_ORIGIN"] && /^https?:\/\/(.*)\.some\.site\.com$/i.match(request.headers["HTTP_ORIGIN"])
	    headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
	    headers['Access-Control-Expose-Headers'] = 'ETag'
	    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
	    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
	    headers['Access-Control-Max-Age'] = '86400'
	    headers['Access-Control-Allow-Credentials'] = 'true'
	  end
	end 

	def create
	  puts 'PostsController.create!!!!!'
	  post_param = params[:post]
	  puts post_param.inspect
	  @post = Post.create(post_params)
	  @post.save!
	  redirect_to @post
	end

  private

    def post_params
      params.require(:post).permit(:name, :body, :created_by)
    end
end

