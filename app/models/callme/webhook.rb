class Callme::Webhook < ApplicationRecord
  include Fanout

  enum hook_type: { raw: 0, qiniu_audit: 1, gitlab: 2 }, _scopes: false, _suffix: :hook
  enum fanout_type: { qiyeweixin: 0 }, _scopes: false, _suffix: :fanout

  before_validation :generate_key, on: :create
  before_validation :fanout_config_to_json

  def example
    Callme::Webhook::Hooks.const_get(hook_type.to_s.camelize).example
  end

  private

    def generate_key
      self.key = SecureRandom.hex(16)
    end

    def fanout_config_to_json
      self.fanout_config = JSON.parse(fanout_config) if fanout_config.is_a?(String)
    rescue JSON::ParserError
      self.fanout_config = {}
    end
end
