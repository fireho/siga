class LoginController < ApplicationController

   layout 'login_siga'

  skip_before_filter :authenticate, :only => [:login]

  def login
    if request.post?
      login = (params[:login]).upcase
      password = (params[:password]).upcase
      senha = User.digest("#{login}#{password}")
      user = User.find(:first, :conditions => ['login = ? and senha = ?', login, senha])
      if user
        session[:user] = user.id
        if session[:return_to] && !session[:return_to].include?(url_for(:action => "login"))
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          redirect_to :controller => "home"
        end
      else
        flash[:error] = "Senha ou login invalidos!"
      end
    end
  end

  def logout
    session[:user] = nil
    render :action => 'login'
  end

end
