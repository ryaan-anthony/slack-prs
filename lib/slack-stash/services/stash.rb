module SlackStash
  class Stash
    def initialize
      @config = Config.new('stash')
    end

    # TODO: remove
    def repos(overrides = {})
      path_options = { path: 'rest/api/latest/repos' }
      request = default_options.merge(overrides).merge(path_options)
      client.get(request)
    end

    def pull_requests(project, repo, overrides = {})
      path = "rest/api/latest/projects/#{project}/repos/#{repo}/pull-requests"
      path_options = { path: URI.encode(path), query: { state: :open, limit: 100 } }
      request = default_options.merge(overrides).merge(path_options)
      client.get(request)
    end

    private

    def default_options
      {
        query: { limit: 1000 },
        headers: authentication
      }
    end

    def authentication
      {
        Authorization: "Basic #{credentials}"
      }
    end

    def credentials
      Base64::encode64("#{@config.username}:#{@config.password}").delete("\n")
    end

    def client
      @client ||= Client.new(@config)
    end
  end
end