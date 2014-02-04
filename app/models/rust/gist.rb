module Rust
  class Gist < ApplicationModel

    belongs_to :author

    has_many :documents

    has_one :post

    self.primary_key = :id

    class << self
      def load(id)
        self.where(id: id).first_or_initialize.load
      end
      def load!(id)
        self.where(id: id).first_or_initialize.load!
      end
    end

    def load
      GistFetcher.perform_async(id)
    end
    def load!
      GistFetcher.new.perform(id)
    end

    def assign_from_api(data)
      self.public     = data.fetch('public')
      self.created_at = data.fetch('created_at')
      self.updated_at = data.fetch('updated_at')
      self.author_id  = data.fetch('owner').fetch('login')
      self
    end

  end
end
