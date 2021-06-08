class ShufflesController < ApplicationController
  skip_forgery_protection

  def create
    parsed_request_body = ActiveSupport::JSON.decode(request.body.string)
    shuffles = ShuffleService.new(parsed_request_body)
    # render json: shuffles.report
    options = { include: [:shuffles, :'shuffles.batches'] }
    render json: ShuffleServiceSerializer.new(shuffles, options).serializable_hash.to_json
  end
end