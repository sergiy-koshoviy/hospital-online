class V1::DoctorsController < ApplicationController
  acts_as_token_authentication_handler_for User
  respond_to :json

  # GET /1.0/doctors/:doctors_category_id {format: json}
  # get list of doctors by doctors_category
  def get_list_by_doctors_category
    render json: Doctor.where(doctors_category_id: params[:doctors_category_id]), status: 200
  end
end