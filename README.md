# Slack Stash

#### Stash pull request notifications for Slack

* Install

```
gem install slack-stash
```

* Configure

1. Rename `mv mongoid.yml{.sample,}` and configure your database.
2. Rename `mv secrets.yml{.sample,}` and add your username/passwords.
3. Rename `mv stash-projects.yml{.sample,}` and add your projects.
4. Setup your projects: 

```
bundle exec rake setup
```

* Refresh pull request data

```
bundle exec rake refresh
```

* Generate report 

```
bundle exec rake report
```
