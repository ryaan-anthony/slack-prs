module SlackStash
  class Response
    def initialize(response)
      @response = response
    end

    def body
      JSON.parse(@response.body)
    end

    def last_page?

    end

    def each
      body['values'].each { |result| yield result }
    end
  end
end