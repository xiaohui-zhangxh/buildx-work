class Callme::WebhooksController < ApplicationController
  before_action :set_callme_webhook, only: %i[ show edit update destroy ]

  # GET /callme/webhooks or /callme/webhooks.json
  def index
    @callme_webhooks = Callme::Webhook.all
  end

  # GET /callme/webhooks/1 or /callme/webhooks/1.json
  def show
  end

  # GET /callme/webhooks/new
  def new
    @callme_webhook = Callme::Webhook.new
  end

  # GET /callme/webhooks/1/edit
  def edit
  end

  # POST /callme/webhooks or /callme/webhooks.json
  def create
    @callme_webhook = Callme::Webhook.new(callme_webhook_params)

    respond_to do |format|
      if @callme_webhook.save
        format.html { redirect_to callme_webhook_url(@callme_webhook), notice: "Webhook was successfully created." }
        format.json { render :show, status: :created, location: @callme_webhook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @callme_webhook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /callme/webhooks/1 or /callme/webhooks/1.json
  def update
    respond_to do |format|
      if @callme_webhook.update(callme_webhook_params)
        format.html { redirect_to callme_webhook_url(@callme_webhook), notice: "Webhook was successfully updated." }
        format.json { render :show, status: :ok, location: @callme_webhook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @callme_webhook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /callme/webhooks/1 or /callme/webhooks/1.json
  def destroy
    @callme_webhook.destroy!

    respond_to do |format|
      format.html { redirect_to callme_webhooks_url, notice: "Webhook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_callme_webhook
      @callme_webhook = Callme::Webhook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def callme_webhook_params
      params.require(:callme_webhook).permit(:name, :hook_type, :fanout_type, :fanout_config)
    end
end
