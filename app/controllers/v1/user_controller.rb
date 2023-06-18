class V1::UserController < ApplicationController
  before_action :verify_token, only: [:me]

  def auth
    user = User.find_by!("lower(email)=lower(?)", params[:email])
    raise Err::Exceptions::InvalidPassword unless user.authenticate(params[:password])
    render json: { token: user.token, data: user }
  end

  def me
    render json: @user
  end

  def register
    user = User.find_by("lower(email)=lower(?)", request[:email])
    raise Err::Exceptions::EmailUsed if user
    user = User.new(params.permit(:email, :password, :name))
    assert_save(user)
    render json: { token: user.token, data: user }
  end


end
