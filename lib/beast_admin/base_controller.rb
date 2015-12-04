# coding: utf-8
class BeastAdmin::BaseController < ActionController::Base

  before_action :authenticate
  before_action :get_vars
  before_action :get_db_cols

  layout false

  def dashboard
    render __dir__ + '/views/layout'
  end

  def index

    @resources = @res_model.all

    @db_cols = []
    @res_model.columns_hash.each{|k,v| @db_cols << {name: k, type: v.type}}

    render __dir__ + '/views/layout'
  end

  def new

    @resource = @res_model.new


    render __dir__ + '/views/layout'
  end

  def create
    @resource = @res_model.new

    @db_cols.each do |col|
      @resource.send("#{col[:name]}=", params[:resource][col[:name].to_sym])
    end

    if @resource.save
      redirect_to BeastAdmin.routes.path_helper(@res_model_str, :show, {id: @resource.id})
    else
      redirect_to BeastAdmin.routes.path_helper(@res_model_str, :new)
    end

  end

  def show
    @db_cols = []
    @res_model.columns_hash.each{|k,v| @db_cols << {name: k, type: v.type}}

    @resource = @res_model.find(params[:id])
    render __dir__ + '/views/layout'
  end

  def edit
    @resource = @res_model.find(params[:id])
    render __dir__ + '/views/layout'
  end

  def update
    @resource = @res_model.find(params[:id])

    @db_cols.each do |col|
      @resource.send("#{col[:name]}=", params[:resource][col[:name].to_sym])
    end

    if @resource.save
      redirect_to BeastAdmin.routes.path_helper(@res_model_str, :show, {id: @resource.id})
    else
      redirect_to BeastAdmin.routes.path_helper(@res_model_str, :edit)
    end
  end

  def destroy
    @resource = @res_model.find(params[:id])

    @resource.destroy

    redirect_to BeastAdmin.routes.path_helper(@res_model_str, :index)
  end


  protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' && password == '123456'
      end
    end

    def get_vars
      @ba_partials_path = __dir__ + '/views/partials'
      @ba_current_model = request.fullpath.split('/')[2].classify
      @res_model_str = request.fullpath.split('/')[2].classify
      @res_model = @ba_current_model.safe_constantize
      @ba_page_title = @ba_current_model + ' | Beast Admin'
      # @ba_current_route_obj = BeastAdmin.config.routes.select{|x| x[:name] == @ba_current_model}.first
    end

    def get_db_cols
      @db_cols = Array.new
      @res_model.columns_hash.each{|k,v| @db_cols << {name: k, type: v.type} unless %W(id created_at updated_at).include?(k.to_s)}
    end

end
