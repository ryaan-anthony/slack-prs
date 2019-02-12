module SlackStash
  class PullRequest
    include Mongoid::Document
    field :number, type: Integer
    field :title, type: String
    field :open, type: Boolean
    field :approved, type: Boolean
    field :conflict, type: Boolean
    field :created_date, type: DateTime
    field :updated_date, type: DateTime
    field :from_ref, type: String
    field :to_ref, type: String
    field :author_id, type: String
    field :reviewer_ids, type: Array
    field :participant_ids, type: Array
    embedded_in :repo, inverse_of: :pull_requests
    scope :pending_review, -> { where(open: true, approved: false, :to_ref.nin => %w[staging master]) }
    scope :approved, -> { where(open: true, approved: true, :to_ref.nin => %w[staging master]) }
    index({ open: 1, approved: 1, to_ref: 1 }, { background: true })

    def link
      "https://stash.tools.weblinc.com/projects/#{repo.project}/repos/#{repo.name}/pull-requests/#{number}"
    end

    def author
      User.find(author_id)
    end

    def reviewers
      reviewer_ids.map { |id| User.find(id) }
    end

    def participants
      participant_ids.map { |id| User.find(id) }
    end
  end
end
