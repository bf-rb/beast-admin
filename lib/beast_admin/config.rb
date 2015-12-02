# coding: utf-8
class BeastAdmin::Config

  def initialize
    @models = Array.new
    @links = Array.new
  end

  def models
    @models
  end

  def models=(val)
    @models += val
  end

  def links
    @links
  end

  def links=(val)
    @links += val
  end

end
