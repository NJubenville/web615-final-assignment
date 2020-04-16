class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.paginate(page: params[:page], per_page: params[:per_page] ||= 30).order(created_at: :desc)
    authorize Subscription
    respond_to do |format|
      format.json { render json: Subscription.all, status: :ok }
      format.html {}
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    respond_to do |format|
      format.json { render json: @subscription }
      format.html { @subscription }
    end
  end

  # GET /subscriptions/new
  def new
    authorize Subscription
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    authorize @subscription

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :bad_request }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      begin
        @subscription = Subscription.friendly.find(params[:id])
      rescue
        respond_to do |format|
          format.json { render status: 404, json: { alert: "The subscription you're looking for cannot be found" } }
          format.html { redirect_to subscriptions_path, alert: "The subscription you're looking for cannot be found" }
        end
      end
      if @subscription.present?
        authorize @subscription # Pass in Model object
      end
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:title, :publication_id)
    end
end
