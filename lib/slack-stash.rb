require 'base64'
require 'excon'
require 'json'
require 'mongoid'
require 'pry'
require 'yaml'

module SlackStash
  autoload :App, 'slack-stash/app'
  autoload :Config, 'slack-stash/config'
  autoload :Stash, 'slack-stash/services/stash'
  autoload :Slack, 'slack-stash/services/slack'
  autoload :Client, 'slack-stash/client'
  autoload :Response, 'slack-stash/response'
  autoload :Repo, 'slack-stash/models/repo'
end

Mongoid.load!('mongoid.yml', :development)