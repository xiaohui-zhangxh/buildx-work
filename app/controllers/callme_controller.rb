class CallmeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    key = params[:key]
    webhook = Callme::Webhook.find_by(key: key)
    if webhook
      result = webhook.fanout(params.as_json)
      json = Rails.env.development? ? result : {}
      if result[:success]
        render json:, status: :ok
      else
        render json:, status: :internal_server_error
      end
    else
      render json: { error: "Webhook not found" }, status: :not_found
    end
  end
end
