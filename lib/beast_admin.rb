# coding: utf-8
require 'beast_admin/version'
require 'beast_admin/base_controller'

module BeastAdmin

  module Rails
    class Engine < ::Rails::Engine
    end
  end

  # @param route_obj [ActionDispatch::Routing::Mapper]
  def self.routes(route_obj)
    route_obj.get('admin', to: 'beast_admin/base#admin')
  end

end
