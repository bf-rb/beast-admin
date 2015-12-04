# coding: utf-8
module BeastAdmin

  class Routes

    # Get Instance
    # @return [BeastAdmin::Routes]
    def self.inst
      @@inst ||= BeastAdmin::Routes.new
    end

    def initialize
      @routes = Array.new
      @@inst = self
    end

    def add_route_data(hash = {})
      @routes << hash
    end

    def path_helper(model_name, action, data = nil)
      ::Rails.application.routes.url_helpers.send("#{find_by_model_name(model_name)[action]}_path", data)
    end

    def url_helper(model_name, action, data = nil)
      ::Rails.application.routes.url_helpers.send("#{find_by_model_name(model_name)[action]}_url", data)
    end

    def all_index
      @routes.map{|r| { href: path_helper(r[:name], :index), title: r[:name]}}
    end

    private
      def find_by_model_name(model_name)
        @routes.find{|m| m[:name] == model_name}
      end

  end

end
