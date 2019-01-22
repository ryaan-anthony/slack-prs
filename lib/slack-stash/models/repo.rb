module SlackStash
  class Repo
    include Mongoid::Document
    field :project, type: String
    field :name, type: String
    embeds_many :pull_requests, class_name: 'SlackStash::PullRequest'

    def pull_request(number)
      pull_requests.find_or_create_by(number: number)
    end
  end
end