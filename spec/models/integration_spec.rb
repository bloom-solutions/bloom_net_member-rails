require 'rails_helper'

RSpec.describe Integration do

  describe "associations" do
    it { is_expected.to have_many(:api_tokens).dependent(:destroy) }
  end

end
