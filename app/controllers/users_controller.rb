class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless @user.confirmed_at
      flash[:error] = 'Email was not confirmed.'
      return redirect_to action: :new
    end
    flash[:success] = 'Welcome, human!'
  end

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      email = user_params[:email].downcase.strip
      if user = User.find_by_email(email)
        format.html { return redirect_to user }
      else
        user = User.new user_params.merge!(
                email: email,
                ip_address: request.remote_ip,
                token: Devise.friendly_token,
                inviter: User.find_by_token(user_params[:ref])
            )
        if user.save
          flash[:notice] = 'Confirmation message have been sent. Please check your email.'
        else
          flash[:error] = 'Invalid email or ip-address'
        end
        format.html {
          if user_params[:ref]
            return redirect_to root_url(ref: user_params[:ref])
          else
            redirect_to action: :new
          end
        }
      end
    end
  end

  def confirm
    user = User.find_by_token(params[:token])
    if !user.confirmed_at and user.confirmed_at = DateTime.now
      respond_to { |format| format.html { redirect_to user } if user.save }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :ref, :ip_address)
  end
end
