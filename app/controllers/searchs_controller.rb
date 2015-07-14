class SearchsController < ApplicationController
  def search_by_hashtag
  	@tagname = params[:tagname]
  	Hashtag.statuses_by_hashtag(@tagname)
  end
end
