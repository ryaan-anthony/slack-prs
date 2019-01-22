module SlackStash
  class App
    def self.run
      stash_service = Stash.new

      # For each project-repo
      # TODO: store repos locally
      count = 0
      stash_service.repos.each do |result|
        next unless result['project']['type'] == 'NORMAL'
        project = result['project']['key']
        repo = result['name']
        # Get all open pull requests
        stash_service.pull_requests(project, repo).each do |pull_request|
          count += 1
          puts count
          #puts ' - ' + pull_request['title']
          # TODO:
          # Save new PRs as mongo record
          # Track all contributions
          # Send notifications
        end
      end
      puts count
      puts :perform
      sleep 5
    end
  end
end