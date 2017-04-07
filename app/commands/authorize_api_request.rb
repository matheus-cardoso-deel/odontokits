class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    authenticated?
  end

  private

  attr_reader :headers

  def authenticated?
    if decoded_auth_token && User.find(decoded_auth_token[:user_id])
      return true
    else
      return errors.add(:token, 'Invalid token') && nil
    end
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present? 
      return headers['Authorization'].split(' ').last
    else 
        errors.add(:token, 'Missing token')
    end
    nil
  end
  
end