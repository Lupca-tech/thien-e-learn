class HomeController < ApplicationController
  def index
    @microposts = Micropost.all.group_by(&:teacher_id)
    
  end
end
