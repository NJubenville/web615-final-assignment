
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /publications
  # GET /publications.json
  def index
    authorize Publication
    # @publications = Publication.all
    @publications = Publication.paginate(page: params[:page], per_page: params[:per_page] ||= 30).order(created_at: :desc)
    respond_to do |format|
      format.json { render json: Publication.all, status: :ok }
      format.html {}
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    respond_to do |format|
      format.json { render json: @publication }
      format.html { @publication }
    end
  end

  # GET /publications/new
  def new
    authorize Publication
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    authorize @publication

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :bad_request }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :bad_request }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    begin
      @publication = Publication.friendly.find(params[:id])
    rescue
      respond_to do |format|
        format.json { render status: 404, json: { alert: "The publication you're looking for cannot be found" } }
        format.html { redirect_to publications_path, alert: "The publication you're looking for cannot be found" }
      end
    end
    if @publication.present?
      authorize @publication # Pass in Model object
    end
  end

  # Only allow a list of trusted parameters through.
  def publication_params
    params.require(:publication).permit(:title)
  end
end