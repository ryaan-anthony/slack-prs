require 'slack-stash'

desc 'Add a repo'
task :add_repo, [:project, :name] do |task, args|
 SlackStash::Repo.find_or_create_by!(args.to_h)
end