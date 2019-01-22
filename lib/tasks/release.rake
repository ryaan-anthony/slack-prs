require 'slack-stash/version'

desc "Release version #{SlackStash::VERSION} of the gem"
task :release do

  system "git tag -a v#{SlackStash::VERSION} -m 'Tagging #{SlackStash::VERSION}'"
  system 'git push --tags'

  system "gem build slack-stash.gemspec"
  system "gem push slack-stash-#{SlackStash::VERSION}.gem"
  system "rm slack-stash-#{SlackStash::VERSION}.gem"
end