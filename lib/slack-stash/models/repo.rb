module SlackStash
  class Repo
    include Mongoid::Document
    field :project, type: String
    field :name, type: String
  end
end