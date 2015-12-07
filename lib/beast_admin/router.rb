# coding: utf-8
class BeastAdmin::Router

  # Get all Rails APP models & create routes
  # @param mapper [ActionDispatch::Routing::Mapper]
  def self.draw_routes(mapper)

    mapper.get('admin', to: 'beast_admin/base#dashboard', as: :beast_admin_dashboard)

    Rails.application.eager_load!

    BeastAdmin.models = ActiveRecord::Base.descendants.map(&:to_s)

    BeastAdmin.models.each do |model|

      str = model.underscore

      path = "beast_admin_#{str}"

      new_path = path + '_new'
      create_path = path + '_create'
      update_path = path + '_update'
      edit_path = path + '_edit'
      show_path = path + '_show'
      delete_path = path + '_delete'

      route_data = {
        name: model,
        index: path,
        new: new_path,
        create: create_path,
        update: update_path,
        edit: edit_path,
        show: show_path,
        delete: delete_path
      }

      BeastAdmin.routes.add_route_data(route_data)

      mapper.scope :admin do

        mapper.get(str, to: 'beast_admin/base#index', as: path)
        mapper.get("#{str}/new", to: 'beast_admin/base#new', as: new_path)
        mapper.get("#{str}/edit/:id", to: 'beast_admin/base#edit', as: edit_path)
        mapper.get("#{str}/:id", to: 'beast_admin/base#show', as: show_path)
        mapper.post(str, to: 'beast_admin/base#create', as: create_path)
        mapper.put("#{str}/edit/:id", to: 'beast_admin/base#update', as: update_path)
        mapper.delete("#{str}/:id", to: 'beast_admin/base#destroy', as: delete_path)

      end

    end

  end

end
