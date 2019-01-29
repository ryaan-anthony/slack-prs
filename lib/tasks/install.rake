require 'slack-stash'

desc 'Add a repo'
task :add, [:project, :name] do |task, args|
 SlackStash::Repo.find_or_create_by!(args.to_h)
 puts 'Done!'
end

desc 'Install repos'
task :install do
  project_manifest.each do |project, repos|
    repos.each do |repo|
     SlackStash::Repo.find_or_create_by!(project: project, name: repo)
    end
  end
  pp project_manifest
  puts 'Done!'
end

def project_manifest
  {
    :BAD => %w[harrietcarter-rails],
    :BREW => %w[olympia paragon yarn],
    :BUS => %w[sanrio world_wide_stereo],
    :BS => %w[rjmatthews],
    :DIBC => %w[doitbest],
    :FDR => %w[urbn-ror woodcraft],
    :JA => %w[jamesavery-v3],
    :KEN => %w[andymark],
    :NS => %w[lime-crime],
    :PHL => %w[justcandy universal],
    :SM => %w[uspolo]
  }
end