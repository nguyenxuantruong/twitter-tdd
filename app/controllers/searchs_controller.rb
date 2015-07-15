class SearchsController < ApplicationController
  def search_by_hashtag
  	@tagname = params[:tagname]
  	@statuses = Hashtag.statuses_by_hashtag(@tagname)
  end
end
