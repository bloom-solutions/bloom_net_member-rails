require 'concepts/concerns/transactional_operation'

class ApplicationOperation < Trailblazer::Operation

  private

  def self.active_record_transaction
    ->(*, &block) { ActiveRecord::Base.transaction { block.call } }
  end

end
