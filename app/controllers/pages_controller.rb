class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :team]
  
  def index
    render :layout => 'external_page'
  end

  def team
    @setores = YAML::load(File.open('public/members.yml'))
    render :layout => 'login'
  end

end
