# Slack Stash

#### Stash pull request notifications for Slack

* Install

```
gem install slack-stash
```

* Configure

1. Copy `mongoid.yml.sample` to `mongoid.yml` and configure your database.
2. Copy `secrets.yml.sample` to `secrets.yml` and add your username/passwords.
3. Copy `stash-projects.yml.sample` to `stash-projects.yml` and add your projects.
4. Setup your projects: 

```
bundle exec rake setup
```

* Run

```
bundle exec rake run
```
