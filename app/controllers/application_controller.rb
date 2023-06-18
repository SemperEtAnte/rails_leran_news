class ApplicationController < ActionController::API
  include ApiErrorHandler

  def assert_save(object)
    ApplicationController::assert_save(object)
  end
  def self.assert_save(object)
    raise Err::CustomException.new(object.errors.full_messages, 422) unless object.save
  end

  def verify_token
    auth = request.headers[:Authorization]
    raise Err::Exceptions::NoToken unless auth
    payload = JWT.decode(auth, ENV['token'] || "test_token")
    puts "PAYLOAD: #{payload[0].to_s}"
    user_id = payload[0]['user_id']
    raise Err::Exceptions::InvalidToken unless user_id
    @user = User.find(user_id)
  rescue JWT::DecodeError
    raise Err::Exceptions::InvalidToken
  rescue JWT::ExpiredSignature
    raise Err::Exceptions::InvalidToken
  end
end
