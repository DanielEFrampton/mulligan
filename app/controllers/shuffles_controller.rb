class ShufflesController < ApplicationController
  def create
    parsed_request_body = ActiveSupport::JSON.decode(request.body.string)
    return_object = {}
    return_object[:deck_before] = parsed_request_body['deck']
    render json: return_object
  end
end