class CallmeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    key = params[:key]
    webhook = Callme::Webhook.find_by(key:)
    if webhook
      request.headers.each do |key, value|
        Rails.logger.debug "Header: #{key} = #{value}" if key.start_with?('HTTP_')
      end
      hook_params = request.post? ? request.params[:callme] : request.params.except('controller', 'action', 'key')
      result = webhook.fanout(hook_params, headers: request.headers)
      if result[:success]
        render json: {}, status: :ok
      else
        Sentry.capture_message('Fanout failed', extra: { webhook_id: webhook.id, result: })
        render json: result, status: :unprocessable_entity
      end
    else
      render json: { error: 'Webhook not found' }, status: :not_found
    end
  end
end
