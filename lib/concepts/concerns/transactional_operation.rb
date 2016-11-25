module Concerns
  module TransactionalOperation

    extend ActiveSupport::Concern

    included do
      class_attribute :transactional
      self.transactional = false
    end

    def run
      if self.class.transactional
        self.class.transaction do
          super
        end
      else
        super
      end
    end

    module ClassMethods
      def transaction
        ActiveRecord::Base.transaction do
          return yield
        end
      end
    end

  end
end
