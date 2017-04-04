class ProcessStellarOperation

  def self.call(remote_op)
    ProcessStellarOperationJob.perform_later(remote_op)
  end

end
