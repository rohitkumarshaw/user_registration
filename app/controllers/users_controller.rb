class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
  end

  def index
    @users = User.find(:all)
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def login_available_check
    @user = User.find_by_login(params[:login_name])
    if !@user.blank?
      render :update do |page|
        page.replace_html 'login_available','<font color=red>Sorry!!!...login name not available</font>'
      end
    else
      render :update do |page|
        page.replace_html 'login_available','<font color=#00CC00>Congrats!!!...login name available</font>'
      end
    end
  end

  def email_available_check
    @vaild_user = User.find_by_email(params[:email])
    if !@vaild_user.blank?
      render :update do |page|
        page.replace_html 'email_available','<font color=red>Sorry!!!...This email is not available</font>'
      end
    else
      render :update do |page|
        page.replace_html 'email_available', '<font color=#00CC00>Congrats!!!...This email is available</font>'
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Updated successfully.'
      redirect_to users_path
    end
  end


  def destroy
    @video = User.find(params[:id])
    @video.destroy

 
    redirect_to users_path(@user)

  end

end
