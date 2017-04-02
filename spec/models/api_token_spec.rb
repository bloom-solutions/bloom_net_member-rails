require 'rails_helper'

RSpec.describe ApiToken do

  describe "associations" do
    it { is_expected.to belong_to(:integration) }
  end

end
