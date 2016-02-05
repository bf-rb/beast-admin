# coding: utf-8
class BeastAdmin::BaseController < ActionController::Base

  before_action :authenticate
  before_action :create_page_obj

  layout 'beast_admin'

  def dashboard
    # render 'layout'
  end

  def index
    @resources = @page.model.all
    # render 'layout'
  end

  def new
    @resource = @page.model.new
    # render 'layout'
  end

  def create
    @resource = @page.model.new

    @page.edit_model_fields.each do |col|
      @resource.send("#{col[:name]}=", params[:resource][col[:name].to_sym])
    end

    if @resource.save
      redirect_to BeastAdmin.routes.path_helper(@page.model_name, :show, {id: @resource.id})
    else
      redirect_to BeastAdmin.routes.path_helper(@page.model_name, :new)
    end

  end

  def show
    @resource = @page.model.find(params[:id])
    # render 'layout'
  end

  def edit
    @resource = @page.model.find(params[:id])
    # render 'layout'
  end

  def update
    @resource = @page.model.find(params[:id])

    @page.edit_model_fields.each do |col|
      @resource.send("#{col[:name]}=", params[:resource][col[:name].to_sym])
    end

    if @resource.save
      redirect_to BeastAdmin.routes.path_helper(@page.model_name, :show, {id: @resource.id})
    else
      redirect_to BeastAdmin.routes.path_helper(@page.model_name, :edit)
    end
  end

  def destroy
    @resource = @page.model.find(params[:id])

    @resource.destroy

    redirect_to BeastAdmin.routes.path_helper(@page.model_name, :index)
  end


  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '123456'
    end
  end

  def create_page_obj

    model = request.fullpath.split('/')[2]

    data = {
      partials_path: __dir__ + '/views/partials',
      title: "#{model.present? ? model.classify : 'Dashboard'} | Beast Admin"
    }

    data[:model_name] = model.classify if model.present?
    data[:model] = data[:model_name].safe_constantize if data[:model_name].present?

    @page = BeastAdmin::Page.new(data)
  end

end
