# frozen_string_literal: true

require 'api_error'

class ApiController < ActionController::API
  # include JsonErrorsHandling
  # include Pundit

  # before_action :remove_user_session_info
  # before_action :authenticate_user!
  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  # Warden always looks for the user id which is present in warden.user.user.key session attribute.
  # To force using always jwt_strategy we need to remove that value for all api requests and
  # this way devise will ignore whatever comes in user's cookies, and therefore prevent
  # CSRF attacks
  def remove_user_session_info
    session['warden.user.user.key'] = nil
  end
end
