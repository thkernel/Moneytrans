class TransfertsController < ApplicationController
  
  before_action :authenticate_account!
  before_action :set_transfert, only: %i[ show edit update destroy ]
  layout "dashboard"

  # GET /transferts or /transferts.json
  def index
    @transferts = Transfert.all
  end

  # GET /transferts/1 or /transferts/1.json
  def show
  end

  # GET /transferts/new
  def new
    @currencies = Currency.all
    @identity_document_types = IdentityDocumentType.all
    @transfert = Transfert.new
  end

  # GET /transferts/1/edit
  def edit
    @currencies = Currency.all
    @identity_document_types = IdentityDocumentType.all
  end

  # POST /transferts or /transferts.json
  def create
    @transfert = current_account.transferts.build(transfert_params)

    respond_to do |format|
      if @transfert.save
        format.html { redirect_to transfert_url(@transfert), notice: "Transfert was successfully created." }
        format.json { render :show, status: :created, location: @transfert }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transferts/1 or /transferts/1.json
  def update
    respond_to do |format|
      if @transfert.update(transfert_params)
        format.html { redirect_to transfert_url(@transfert), notice: "Transfert was successfully updated." }
        format.json { render :show, status: :ok, location: @transfert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfert.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @transfert = Transfert.find_by(uid: params[:transfert_id])
  end

  # DELETE /transferts/1 or /transferts/1.json
  def destroy
    @transfert.destroy

    respond_to do |format|
      format.html { redirect_to transferts_url, notice: "Transfert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfert
      @transfert = Transfert.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transfert_params
      params.require(:transfert).permit(:currency_id, :reason, :amount_incl_tax, :sender_name, :sender_first_name, :sender_gender, :sender_phone, :sender_identity_document_type_id, :sender_identity_document_type_code, :sender_country, :sender_city, :beneficiary_name, :beneficiary_first_name, :beneficiary_gender, :beneficiary_phone, :beneficiary_country, :beneficiary_city)
    end
end
