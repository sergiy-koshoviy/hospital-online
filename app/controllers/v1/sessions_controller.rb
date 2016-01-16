class V1::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create]
  skip_before_filter :verify_signed_out_user, only: :destroy
  acts_as_token_authentication_handler_for User

  respond_to :json

  def create
    if params[:email].present? && params[:password].present?
      resource = User.find_for_database_authentication(:email => params[:email])
      return invalid_login_attempt unless resource
    elsif params[:email].present?
      no_pass_attempt
      return
    elsif params[:password].present?
      no_email_attempt
      return
    else
      no_email_password_attempt
      return
    end

    if resource.valid_password?(params[:password])
      if resource.authentication_token.blank?
        resource.save
      end
      render json: get_user_data(resource), status: 200
    else
      invalid_login_attempt
      return
    end
  end

  def show
    if current_user
      render json: get_user_data(current_user), status: 200

    else
      failure
      return
    end
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :store => false, :recall => "#{controller_path}#failure")
    current_user.authentication_token = nil
    current_user.save!
    render :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }, response_status: 200
  end

  private

  def get_user_data(user)
    { token: user.authentication_token,
      id: user.id,
      firstName: user.fname,
      lastName: user.lname,
      email: user.email,
      # image: {
      #     :fullsizeUrl => user.image.url,
      #     :thumbnailUrl => user.image.try(:thumb).try(:url) },
      gender: user.gender
    }
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "User with specified username and password is not found", code: 4 },
           :success => false
  end

  # response for invalid login through facebook
  def no_user_with_facebook_uid_or_email_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "User with specified facebook uid or email is not found", code: 16 },
           :success => false
  end

  def no_facebook_uid_oauth_token_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "Facebook uid and oauth token are required parameters for the request.", code: 13 },
           :success => false
  end

  def no_facebook_uid_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "Facebook uid is a required parameter for the request.", code: 14 },
           :success => false
  end

  def no_oauth_token_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "Auth token is a required parameter for the request.", code: 15 },
           :success => false
  end

  def no_pass_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "Password is a required parameter for the request.", code: 2 },
           :success => false
  end

  def no_email_password_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "Email and password are required parameters for the request.", code: 3 },
           :success => false
  end

  def no_email_attempt
    warden.custom_failure!
    render :status => 401,
           :json => { :errors => "Email is a required parameter for the request.", code: 1 },
           :success => false
  end

  def failure
    render :status => 401,
           :json => { :errors => "Autorization Failed", code: 0}
  end
end