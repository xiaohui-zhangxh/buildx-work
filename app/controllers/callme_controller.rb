class CallmeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    key = params[:key]
    webhook = Callme::Webhook.find_by(key: key)
    if webhook
      result = webhook.fanout(request.params.except('controller', 'action', 'key'))
      if result[:success]
        render json: {}, status: :ok
      else
        Sentry.capture_message("Fanout failed", extra: { webhook_id: webhook.id, result: })
        render json: result, status: :unprocessable_entity
      end
    else
      render json: { error: "Webhook not found" }, status: :not_found
    end
  end
end
