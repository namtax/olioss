module Clients
  class ArticlesClient
    def self.get
      response = Net::HTTP.get_response(URI(uri))
      response.body
    rescue StandardError => e 
      Rollbar.error(e)
      []
    end

    def self.uri
      ENV['ARTICLES_URL']
    end
  end
end