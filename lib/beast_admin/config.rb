# coding: utf-8
class BeastAdmin::Config

  def initialize
    @models = Array.new
    @routes = Array.new
  end

  def models
    @models
  end

  def models=(val)
    @models += val
  end

end
