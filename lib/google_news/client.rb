require "rss"
require "uri"

module GoogleNews
  class Client
    def initialize(options={})
      @base_url = "http://news.google.com/rss"
      @country  = options[:country]  || :ja
      @language = options[:language] || :ja
      @edition  = options[:edition]  || :jp
    end

    def take(path, options={})
      RSS::Parser.parse(url(path, options))
    end

    def search(keyword, options={})
      options[:keyword] = keyword
      take("/search", options)
    end

    def topic(topic, options={})
      options[:topic] = topic
      take("/topic/#{topic}", options)
    end

    private
      def url(path, options)
        URI.encode(@base_url + path + query(options))
      end

      def query(options)
        raise GoogleNews::Error if options[:keyword] && options[:topic]
        "?#{options[:keyword] && 'q=' + options[:keyword]}&gl=#{options[:country] || @country}&hl=#{options[:language] || @language}&ned=#{options[:edition] || @edition}"
      end
  end
end
