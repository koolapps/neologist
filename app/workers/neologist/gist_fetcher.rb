module Neologist
  class GistFetcher
    include Sidekiq::Worker
    def perform(gist_id)
      Gist.where(id: gist_id).first_or_initialize.
        assign_from_api(Github::Gists.new.get(gist_id).body).
        update(fetched_at: Time.current)
    end
  end
end
