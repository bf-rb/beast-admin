# coding: utf-8
class BeastAdmin::BaseController < ActionController::Base

  layout false

  def admin
    render __dir__ + '/views/layout'
  end

end
