# coding: utf-8
class BeastAdmin::Page

  def initialize(options = {})

    @partials_path = options[:partials_path]
    @model = options[:model]
    @model_name = options[:model_name]
    @title = options[:title]

  end

  def model
    @model
  end

  def model_name
    @model_name
  end

  def all_model_fields
    fields = []
    @model.columns_hash.each{|k,v| fields << {name: k, type: v.type}}
    fields
  end

  def edit_model_fields
    fields = []
    @model.columns_hash.each{|k,v| fields << {name: k, type: v.type} unless %W(id created_at updated_at).include?(k.to_s)}
    fields
  end

  def title
    @title
  end

  def partials_path
    @partials_path
  end

end
