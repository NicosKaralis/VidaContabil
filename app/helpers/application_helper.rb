module ApplicationHelper
  
  def title
    base = "VidaContabil"
    if @title.nil? || @title.empty?
      return base
    else
      return "#{@title} | #{base}"
    end
  end
  
end
