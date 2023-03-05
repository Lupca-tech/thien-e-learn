class HomeController < ApplicationController
  def index
    @microposts = Micropost.all.group_by(&:teacher_id)
    @subjects = Subject.all
  end
end
