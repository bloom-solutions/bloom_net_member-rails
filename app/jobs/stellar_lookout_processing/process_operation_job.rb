module StellarLookoutProcessing
  class ProcessOperationJob < ApplicationJob

    def perform(operation)
      StellarLookoutProcessing::ProcessOperation.(operation)
    end

  end
end
