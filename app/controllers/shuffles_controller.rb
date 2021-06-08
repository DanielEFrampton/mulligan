class ShufflesController < ApplicationController
  skip_forgery_protection

  def create
    parsed_request_body = ActiveSupport::JSON.decode(request.body.string).deep_symbolize_keys
    shuffles = ShuffleService.new(parsed_request_body[:deck], parsed_request_body[:shuffle_requests])
    render json: shuffles.serialize
  end
end