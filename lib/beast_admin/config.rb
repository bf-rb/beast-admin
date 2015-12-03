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

  def routes
    @routes
  end

  def routes=(val)
    @routes += val
  end

end
