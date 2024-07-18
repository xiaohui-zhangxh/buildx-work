require "test_helper"

class Callme::WebhooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @callme_webhook = callme_webhooks(:one)
  end

  test "should get index" do
    get callme_webhooks_url
    assert_response :success
  end

  test "should get new" do
    get new_callme_webhook_url
    assert_response :success
  end

  test "should create callme_webhook" do
    assert_difference("Callme::Webhook.count") do
      post callme_webhooks_url, params: { callme_webhook: { fanout_config: @callme_webhook.fanout_config, fanout_type: @callme_webhook.fanout_type, key: @callme_webhook.key, name: @callme_webhook.name } }
    end

    assert_redirected_to callme_webhook_url(Callme::Webhook.last)
  end

  test "should show callme_webhook" do
    get callme_webhook_url(@callme_webhook)
    assert_response :success
  end

  test "should get edit" do
    get edit_callme_webhook_url(@callme_webhook)
    assert_response :success
  end

  test "should update callme_webhook" do
    patch callme_webhook_url(@callme_webhook), params: { callme_webhook: { fanout_config: @callme_webhook.fanout_config, fanout_type: @callme_webhook.fanout_type, key: @callme_webhook.key, name: @callme_webhook.name } }
    assert_redirected_to callme_webhook_url(@callme_webhook)
  end

  test "should destroy callme_webhook" do
    assert_difference("Callme::Webhook.count", -1) do
      delete callme_webhook_url(@callme_webhook)
    end

    assert_redirected_to callme_webhooks_url
  end
end
