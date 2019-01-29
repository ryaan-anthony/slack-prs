require 'base64'
require 'excon'
require 'json'
require 'mongoid'
require 'pry'
require 'yaml'

module SlackStash
  autoload :App, 'slack-stash/app'
  autoload :Client, 'slack-stash/client'
  autoload :Config, 'slack-stash/config'
  autoload :PullRequest, 'slack-stash/models/pull_request'
  autoload :RefreshPullRequests, 'slack-stash/services/stash/refresh_pull_requests'
  autoload :Repo, 'slack-stash/models/repo'
  autoload :Response, 'slack-stash/response'
  autoload :Slack, 'slack-stash/services/slack'
  autoload :Stash, 'slack-stash/services/stash'
  autoload :User, 'slack-stash/models/user'
end

Mongoid.load!('mongoid.yml', :development)