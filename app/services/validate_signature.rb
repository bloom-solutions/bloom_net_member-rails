class ValidateSignature

  def self.call(secret:, signature:, body:)
    OpenSSL::HMAC.hexdigest("SHA256", secret, body) == signature
  end

end
