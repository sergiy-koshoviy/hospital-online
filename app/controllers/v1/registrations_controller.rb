class V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, only: [:create]

  respond_to :json

  # For sign up users
  def create
    user = User.new(email: params[:email],
                    password: params[:password],
                    fname: params[:first_name],
                    lname: params[:last_name],
                    birthday: params[:birthday],
                    gender: params[:gender]
    )
    if user.save
      user.user_roles << UserRole.where(name: params[:user_roles])

      render json: { token: user.authentication_token,
                     id: user.id,
                     firstName: user.fname,
                     lastName: user.lname,
                     email: user.email,
                     # image: {
                     #     fullsizeUrl: user.image.url,
                     #     thumbnailUrl: user.image.thumb.url },
                     roles: user.user_roles.pluck(:name),
                     birthday: user.user_roles.pluck(:name),
                     gender: user.gender
             }, status: 201

    elsif user.errors[:email].present? and user.errors[:email][0] == "has already been taken"
      taken_email_password_attempt
    elsif user.errors[:email].present?
      no_email_password_attempt
    elsif user.errors[:password].present?
      no_pass_attempt
    elsif user.errors[:fname].present?
      no_firstname_attempt
    elsif user.errors[:lname].present?
      no_lastname_attempt
    elsif user.errors[:birthday].present?
      no_birthday_attempt
    elsif user.errors[:gender].present?
      no_gender_attempt
    else
      warden.custom_failure!
      render :json => { :errors => user.errors, :code => 13},  :status=>422, :success => false
    end
  end

  def update
    update_params = {}
    update_params[:growth] = params[:growth] if params[:growth]
    update_params[:growth] = params[:blood_pressure] if params[:blood_pressure]

    user = current_user

    if update_params && user.update_attributes(update_params)
      render json: { token: user.authentication_token,
                     id: user.id,
                     firstName: user.fname,
                     lastName: user.lname,
                     email: user.email,
                     # image: {
                     #     fullsizeUrl: user.image.url,
                     #     thumbnailUrl: user.image.thumb.url },
                     roles: user.user_roles.pluck(:name),
                     birthday: user.user_roles.pluck(:name),
                     gender: user.gender
             }, status: 201
    elsif update_params.blank?
      warden.custom_failure!
      render :json => { :errors => 'Params are blank', :code => 16},  :status=>422, :success => false
    else
      warden.custom_failure!
      render :json => { :errors => user.errors, :code => 17},  :status=>422, :success => false
    end
  end

  private

  def no_email_password_attempt
    warden.custom_failure!
    render :status => 422,
           :json => { :errors => "Email not exist or not valid.", :code => 8 },
           :success => false
  end

  def taken_email_password_attempt
    warden.custom_failure!
    render :status => 422,
           :json => { :errors => "Email has already been taken.", :code => 9 },
           :success => false
  end

  def no_pass_attempt
    warden.custom_failure!
    render :status => 422,
           :json => { :errors => "Password not exist or not valid (minimum 8 char. max 128)", :code => 10 },
           :success => false
  end

  def no_lastname_attempt
    warden.custom_failure!
    render :status => 422,
           :json => { :errors => "Lastname a required parameter for the request", :code => 11 },
           :success => false
  end
  def no_firstname_attempt
    warden.custom_failure!
    render :status => 422,
           :json => { :errors => "Firstname a required parameter for the request", :code => 12 },
           :success => false
  end
  def no_birthday_attempt
    warden.custom_failure!
    render :status => 422,
           :json => { :errors => "Birthday a required parameter for the request", :code => 14 },
           :success => false
  end
  def no_gender_attempt
    warden.custom_failure!
    render :status => 422,
           :json => { :errors => "Gender a required parameter for the request", :code => 15 },
           :success => false
  end
end