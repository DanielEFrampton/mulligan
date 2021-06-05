class ShufflesController < ApplicationController
  def create
    return_object = {}
    render json: return_object
  end
end