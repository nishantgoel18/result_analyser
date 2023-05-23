class Api::ResultDataController < ApplicationController

  skip_forgery_protection
  
  def create
    result = Result.new(subject: params[:subject], marks: params[:marks]&.to_f, timestamp: params[:timestamp])
    if result.save
      head :created
    else
      render json: {errors: result.errors.full_messages}, status: 422
    end
  end

end
