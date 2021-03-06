class EnrollmentsController < ApplicationController

  load_and_authorize_resource

  def index
    #if current_user
    #  @user = Enrollment.find(current_user.id)
    #end
    #render :action => :mysolar

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml  { render :xml => @users }
    #end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @enrollment }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @enrollment }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      format.html
      format.xml  { render :xml => @enrollment }
    end
  end

  def update
    respond_to do |format|
      format.html
      format.xml  { render :xml => @enrollment }
    end
  end

  def destroy
    @enrollment.destroy

    respond_to do |format|
      format.html #{ redirect_to(users_url, :notice => 'Usuario excluido com sucesso!') }
      format.xml  { head :ok }
    end
  end

end
