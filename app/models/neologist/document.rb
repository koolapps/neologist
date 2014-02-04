module Neologist
  class Document < ApplicationModel
    self.primary_key = :name

    belongs_to :gist, inverse_of: :documents
    validate :name, uniqueness: true, scope: :gist_id

    def assign_from_api(data)
      assign_attributes(
        language: data.fetch(:language),
        content:  data.fetch(:content)
      )
    end

  end
end
