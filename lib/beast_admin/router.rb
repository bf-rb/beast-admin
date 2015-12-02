# coding: utf-8
class BeastAdmin::Router

  # @param mapper [ActionDispatch::Routing::Mapper]
  def self.draw_routes(mapper)
    mapper.get('admin', to: 'beast_admin/base#admin')

    BeastAdmin.config.models.map do |model|

      if model.is_a?(String)
        str = model.downcase

        path = "beast_admin_#{str}"

        BeastAdmin.config.links << {name: model, helper: path}

        mapper.scope :admin do

          mapper.get(str, to: 'beast_admin/base#admin', as: path)

        end


      end



    end

  end


end
