module SessionsHelper
    
  # Devise methods
  #user_signed_in?
  #current_user
  #user_session
  def current_user?(user)
    user == current_user
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end 
  
end