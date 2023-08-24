class IdentityDocumentTypesController < ApplicationController
  before_action :authenticate_account!
  before_action :set_identity_document_type, only: %i[ show edit update destroy ]
  layout "dashboard"
  
  # GET /identity_document_types or /identity_document_types.json
  def index
    @identity_document_types = IdentityDocumentType.all
  end

  # GET /identity_document_types/1 or /identity_document_types/1.json
  def show
  end

  # GET /identity_document_types/new
  def new
    @identity_document_type = IdentityDocumentType.new
  end

  # GET /identity_document_types/1/edit
  def edit
  end

  # POST /identity_document_types or /identity_document_types.json
  def create
    @identity_document_type = current_account.identity_document_types.build(identity_document_type_params)

    respond_to do |format|
      if @identity_document_type.save
        @identity_document_types = IdentityDocumentType.all
        format.html { redirect_to identity_document_type_url(@identity_document_type), notice: "Identity document type was successfully created." }
        format.json { render :show, status: :created, location: @identity_document_type }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @identity_document_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /identity_document_types/1 or /identity_document_types/1.json
  def update
    respond_to do |format|
      if @identity_document_type.update(identity_document_type_params)
        @identity_document_types = IdentityDocumentType.all
        format.html { redirect_to identity_document_type_url(@identity_document_type), notice: "Identity document type was successfully updated." }
        format.json { render :show, status: :ok, location: @identity_document_type }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @identity_document_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @identity_document_type = IdentityDocumentType.find_by(uid: params[:identity_document_type_id])
    end

  # DELETE /identity_document_types/1 or /identity_document_types/1.json
  def destroy
    @identity_document_type.destroy

    respond_to do |format|
      format.html { redirect_to identity_document_types_url, notice: "Identity document type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identity_document_type
      @identity_document_type = IdentityDocumentType.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def identity_document_type_params
      params.require(:identity_document_type).permit(:name)
    end
end
