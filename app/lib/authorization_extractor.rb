class AuthorizationExtractor

  include Virtus.model(constructor: false)
  attribute :str, String
  attribute :token, String, lazy: true, default: :default_token
  attribute :signature, String, lazy: true, default: :default_signature
  attribute(:token_signature, String, {
    lazy: true,
    default: :default_token_signature,
  })

  DEFAULT_TYPE = "HMAC-SHA256"

  def initialize(str)
    self.str = str
  end

  private

  def default_token
    return nil if token_signature.nil?
    token_signature[0]
  end

  def default_signature
    return nil if token_signature.nil?
    token_signature[1]
  end

  def default_token_signature
    match_data = str.match(/#{DEFAULT_TYPE}\s(.*)/)
    return nil if match_data.nil?
    match_data[1].split(":")
  end

end
