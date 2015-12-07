module BeastAdmin
  class InstallGenerator < ::Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer
      template 'beast_admin.rb', 'config/initializers/beast_admin.rb'
    end

    def install_assets
      template 'beast_admin.js.coffee', 'app/assets/javascripts/beast_admin.js.coffee'
      template 'beast_admin.css.scss', 'app/assets/stylesheets/beast_admin.scss'

      insert_into_file 'config/initializers/assets.rb', after: ".js )\n" do
        "\nRails.application.config.assets.precompile += %w( beast_admin.css beast_admin.js )"
      end
    end

    def setup_routes
      route 'BeastAdmin.draw_routes(self)'
    end

  end
end