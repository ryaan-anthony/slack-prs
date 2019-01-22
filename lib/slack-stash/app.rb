module SlackStash
  class App
    def self.run
      # For each project-repo
      Repo.each do |repo|
        # Get all open pull requests
        Stash.new.pull_requests(repo.project, repo.name).each do |pull_request|

          puts ' - ' + pull_request['title']
          # TODO:
          # Save new PRs as mongo record
          # Track all contributions
          # Send notifications
        end
      end
      puts :perform
      sleep 60
    end
  end
end