class V1::DoctorsCategoriesController < ApplicationController
  acts_as_token_authentication_handler_for User
  respond_to :json

  # GET /1.0/doctors_categories {format: json}
  # get doctors_categories lists
  def list
    render json: DoctorsCategory.all, status: 201
  end
end