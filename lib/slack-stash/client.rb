module SlackStash
  class Client
    def initialize(config)
      @config = config
    end

    def post(request)
      call(:post, request)
    end

    def get(request)
      call(:get, request)
    end

    private

    def call(method, request)
      Response.new(client.send(method, request))
    end

    def client
      Excon.new(@config.host, expects: [200])
    end
  end
end