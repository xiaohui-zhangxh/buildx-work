class Callme::Webhook::Fanouts::Qiyeweixin
  def initialize(webhook)
    @webhook = webhook
  end

  def run(content)
    return { success: false, error_message: "empty message" } if content.blank?
    return { success: false, error_message: "key is empty" } if key.blank?

    message = {
      msgtype: "text",
      text: {
        content: "[#{@webhook.name}] #{content}"
      }
    }
    resp = notice(message)
    body = JSON.parse(resp.body) rescue {}
    body = {} unless body.is_a?(Hash)
    { success: resp.success? && body['errcode'] == 0, message: body['errmsg'] }
  end

  private

    def key
      @webhook.fanout_config['key']
    end

    def notice(message)
      url = "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=#{key}"
      Rails.logger.debug("POST #{url} #{message.to_json}")
      Faraday.post(url, message.to_json, "Content-Type" => "application/json")
    end
end
