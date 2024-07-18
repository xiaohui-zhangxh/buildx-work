require "application_system_test_case"

class Callme::WebhooksTest < ApplicationSystemTestCase
  setup do
    @callme_webhook = callme_webhooks(:one)
  end

  test "visiting the index" do
    visit callme_webhooks_url
    assert_selector "h1", text: "Webhooks"
  end

  test "should create webhook" do
    visit callme_webhooks_url
    click_on "New webhook"

    fill_in "Fanout config", with: @callme_webhook.fanout_config
    fill_in "Fanout type", with: @callme_webhook.fanout_type
    fill_in "Key", with: @callme_webhook.key
    fill_in "Name", with: @callme_webhook.name
    click_on "Create Webhook"

    assert_text "Webhook was successfully created"
    click_on "Back"
  end

  test "should update Webhook" do
    visit callme_webhook_url(@callme_webhook)
    click_on "Edit this webhook", match: :first

    fill_in "Fanout config", with: @callme_webhook.fanout_config
    fill_in "Fanout type", with: @callme_webhook.fanout_type
    fill_in "Key", with: @callme_webhook.key
    fill_in "Name", with: @callme_webhook.name
    click_on "Update Webhook"

    assert_text "Webhook was successfully updated"
    click_on "Back"
  end

  test "should destroy Webhook" do
    visit callme_webhook_url(@callme_webhook)
    click_on "Destroy this webhook", match: :first

    assert_text "Webhook was successfully destroyed"
  end
end
