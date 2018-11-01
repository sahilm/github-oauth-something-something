class SessionsController < ApplicationController
  def create
    $token = auth_hash['credentials']['token']
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
