require 'concepts/concerns/transactional_operation'

class ApplicationOperation < Trailblazer::Operation

  include Concerns::TransactionalOperation

end
