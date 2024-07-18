json.extract! callme_webhook, :id, :name, :key, :fanout_type, :fanout_config, :created_at, :updated_at
json.url callme_webhook_url(callme_webhook, format: :json)
