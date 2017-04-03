class IntegrationDatum < ApplicationRecord

  belongs_to :owner, polymorphic: true

end
