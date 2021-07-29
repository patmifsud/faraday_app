


class Embed
  include HTTParty
    attr_accessor :url 

    def initialize(url='https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Blank-document-broken.svg/1024px-Blank-document-broken.svg.png')  
      @url = url  
      @result = JSON.parse(HTTParty.get("https://noembed.com/embed?url=#{@url}"))
    end  

    def success
      if @result.key?("error")
        return false 
      else true
      end
    end

    def provider_name
      @result['provider_name']
    end

    def title
      @result['title']
    end

    def author_url
      @result['author_url']
    end

    def author_name
      @result['author_name']
    end


    def html
      @result['html']
    end

end

