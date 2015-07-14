module StatusesHelper

	REGEX_TAG = /(?:\s|^)(?:#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$)))(\w+)(?=\s|$)/i

	def add_hashtag (post, content)
		tags = (content.scan REGEX_TAG).join(" ").split(' ')
		tags.each do |tag|
			exist_tag = Hashtag.find_by_name(tag)
			if exist_tag.nil?
				hashtag = Hashtag.create(:name => tag)
				post.hashtags << hashtag
			else
				post.hashtags << exist_tag
			end
		end
	end

	def render_with_hashtags(content)
		tags = (content.scan REGEX_TAG).join(" ").split(' ')
    content_words = content.split(" ")
    content_with_links = content_words.map do |word|
    	tag_word = word[1, word.length]
      if tags.include? (tag_word)
      	hashtag = Hashtag.find_by_name(tag_word)
        link_to "##{hashtag.name}", searchs_hashtag_path + "?tagname=#{hashtag.name}"
      else
        word
      end
    end

    simple_format(content_with_links.join(" "))
  end
end
