class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:title, :body, :published, :published_at)
    end

end
