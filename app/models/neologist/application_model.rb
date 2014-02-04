module Neologist
  class ApplicationModel < ActiveRecord::Base
    self.abstract_class = true

    module GlobalExtensions
      def first_or_build(args={}, &block)
        first || scoping { proxy_association.build(*args, &block) }
      end
    end

  end
end
