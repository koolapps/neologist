module Neologist
  class Gist < ApplicationModel
    self.primary_key = :id

    belongs_to :author

    has_many :documents, -> { extending GlobalExtensions }, inverse_of: :gist
    accepts_nested_attributes_for :documents

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
      assign_attributes(
        public:                 data.fetch(:public),
        description:            data.fetch(:description),
        created_at:             data.fetch(:created_at),
        updated_at:             data.fetch(:updated_at),
        author_id:              data.fetch(:owner).fetch(:login)
      )
      data.fetch(:files).each do |file_name, file_data|
        self.documents.where(name: file_name).
          first_or_build.
          assign_from_api(file_data)
      end
      self
    end

  end
end
