module SlackStash
  class App
    def self.run
      puts :start
      # Refresh PRs
      RefreshPullRequests.new.perform

      # TODO: Send notifications to slack
      # - count of open PRs per project
      # - oldest open PRs
      # - PRs with conflicts
      # TODO: Track all contributions
      # TODO: Send notifications to slack

      puts :end
    end
  end
end