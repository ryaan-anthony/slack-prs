module SlackStash
  class Slack
    def initialize
      @config = Config.new('slack')
    end
  end
end