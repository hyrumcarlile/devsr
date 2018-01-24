# Override the devise registrations controller to verify recaptcha upon sign up
class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(params[:user].permit(:email, :password, :password_confirmation))
    if verify_recaptcha(model: @user)
      super
    else
      render 'new'
    end
  end
end