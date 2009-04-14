module SigaSpec

  #
  # Autho
  def autho_login_as(user)
    @current_user = mock_model(User)
    User.should_receive(:find_by_id).any_number_of_times.and_return(@current_user)
    @current_user.should_receive(:has_role?).any_number_of_times.with(user.to_s).and_return(true)

    #handle all other role queries
    # @current_user.stub!(:has_role?).and_return(false)
    # @current_user.stub!(:has_permission?).and_return(false)
    @current_user.stub!(:time_zone).and_return('Brasilia')
    @current_user.stub!(:locale).and_return('pt')

    @current_user.stub!(:login).and_return("admin")
    request.session[:user] = @current_user
    request.session[:current_user] = @current_user
    controller.stub!(:current_user).and_return(@current_user)
  end


end
