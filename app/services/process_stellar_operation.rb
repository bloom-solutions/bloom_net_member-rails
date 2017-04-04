class ProcessStellarOperation

  def self.call(operation)
    StellarLookoutProcessing::ProcessOperationJob.perform_later(operation)
  end

end
