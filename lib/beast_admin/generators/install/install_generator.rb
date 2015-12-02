module BeastAdmin
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer
      template 'beast_admin.rb', 'config/initializers/beast_admin.rb'
    end

  end
end