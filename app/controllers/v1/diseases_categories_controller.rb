class V1::DiseasesCategoriesController < ApplicationController
  acts_as_token_authentication_handler_for User
  respond_to :json

  # GET /1.0/diseases_categories {format: json}
  # get the lists of all diseases_categories
  def all_list
    list = DiseasesCategory.all
    render json: list, status: 201
  end

  # GET /1.0/diseases_categories/:doctors_category_id {format: json}
  # get the lists of diseases_categories by doctors_categories
  def get_list_by_doctors_category
    doctors_category = params[:doctors_category_id] ? DoctorsCategory.find_by_id(params[:doctors_category_id]) : nil

    if doctors_category
      render json: doctors_category.diseases_categories, status: 201
    else
      render json: {error: 'Doctors category is absent'}, status: 400
    end
  end
end