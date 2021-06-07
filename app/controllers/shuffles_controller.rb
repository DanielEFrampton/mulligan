class ShufflesController < ApplicationController
  skip_forgery_protection

  def create
    parsed_request_body = ActiveSupport::JSON.decode(request.body.string)
    shuffles = ShuffleService.new(parsed_request_body)
    render json: shuffles.report
  end
end