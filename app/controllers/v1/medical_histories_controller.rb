class V1::MedicalHistoriesController < ApplicationController
  acts_as_token_authentication_handler_for User
  respond_to :json

  # GET /1.0/medical_histories/create {format: json}
  # create new histories
  def create
    history = MedicalHistory.new(medical_history_params)
    history.user_id = current_user.id

    if history.save
      history.symptoms << Symptom.where(id: params[:symptoms]) if params[:symptoms]
      render json: get_history_data(history), status: 201
    else
      render :json => { :errors => history.errors},  :status=>422, :success => false
    end
  end

  private
  def medical_history_params
    params.require(:medical_history).permit(:description, :diseases_category_id)
  end

  def get_history_data(history)
    {
        id: history.id,
        user_id: history.user_id,
        diseases_category: history.diseases_category,
        symptoms: history.symptoms
    }
  end
end