module SlackStash
  class Config
    FILENAME = 'secrets.yml'.freeze

    def initialize(node)
      @node = node
    end

    def data
      @data ||= YAML::load_file(FILENAME)[@node]
    end

    def method_missing(method, *args)
      data[method.to_s]
    end
  end
end