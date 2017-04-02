require 'rails_helper'

RSpec.describe AuthorizationExtractor do

  describe "#token_signature" do
    subject { extractor.token_signature }

    context "there is a match" do
      let(:extractor) { described_class.new("HMAC-SHA256 abcde:signature") }
      it { is_expected.to eq %w(abcde signature) }
    end

    context "there is no match" do
      let(:extractor) { described_class.new("wrong abcde:signature") }
      it { is_expected.to be_nil }
    end
  end

  describe "#token" do
    subject { extractor.token }

    context "there is a match" do
      let(:extractor) { described_class.new("HMAC-SHA256 abcde:signature") }
      it { is_expected.to eq "abcde" }
    end

    context "there is no match" do
      let(:extractor) { described_class.new("wrong abcde:signature") }
      it { is_expected.to be_nil }
    end
  end

  describe "#signature" do
    subject { extractor.signature }

    context "there is a match" do
      let(:extractor) { described_class.new("HMAC-SHA256 abcde:signature") }
      it { is_expected.to eq "signature" }
    end

    context "there is no match" do
      let(:extractor) { described_class.new("wrong abcde:signature") }
      it { is_expected.to be_nil }
    end
  end

end
