module SlackStash
  class RefreshPullRequests
    # Update all open pull requests
    def perform
      Repo.each do |repo|
        repo.pull_requests.destroy_all
        pull_requests(repo.project, repo.name).each do |response|
          pull_request = repo.pull_request(response['id'])
          merge_result = response['properties']['mergeResult']
          pull_request.update!(
            title: response['title'],
            open: response['open'],
            approved: response['reviewers'].any? { |review| review['approved'] },
            conflict: merge_result && merge_result['outcome'] == 'CONFLICTED',
            created_date: to_datetime(response['createdDate']),
            updated_date: to_datetime(response['updatedDate']),
            from_ref: response['fromRef']['displayId'],
            to_ref: response['toRef']['displayId'],
            author_id: user_id(response['author']),
            reviewer_ids: response['reviewers'].map { |reviewer| user_id(reviewer) },
            participant_ids: response['participants'].map { |participant| user_id(participant) }
          )
        end
      end
    end

    def user_id(user_data)
      User.find_or_create_by!(name: user_data['user']['name']).id
    end

    def to_datetime(timestamp)
      Time.at(timestamp.to_f / 1000).to_datetime
    end

    def pull_requests(project, name)
      Stash.new.pull_requests(project, name)
    end
  end
end