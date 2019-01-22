module SlackStash
  class Slack
    def initialize
      @config = Config.new('secrets.yml', 'slack')
    end
  end
end