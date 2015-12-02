# coding: utf-8
class BeastAdmin::BaseController < ActionController::Base

  before_action :authenticate
  before_action :get_vars

  layout false

  def admin
    render __dir__ + '/views/layout'
  end



  protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' && password == '123456'
      end
    end

    def get_vars
      @ba_partials_path = __dir__ + '/views/partials'
    end

end
