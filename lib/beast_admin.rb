# coding: utf-8
require 'beast_admin/version'
require 'beast_admin/base_controller'
require 'beast_admin/config'
require 'beast_admin/router'
# require 'beast_admin/generators/install/install_generator'

module BeastAdmin

  module Rails
    class Engine < ::Rails::Engine
    end
  end

  def self.config
    @@config || Config.new
  end

  def self.configure
    @@config = Config.new
    yield @@config
  end

  # @param mapper [ActionDispatch::Routing::Mapper]
  def self.routes(mapper)
    Router.draw_routes(mapper)
  end

end
