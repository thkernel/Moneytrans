class TransferReasonsController < ApplicationController
  before_action :set_transfer_reason, only: %i[ show edit update destroy ]

  # GET /transfer_reasons or /transfer_reasons.json
  def index
    @transfer_reasons = TransferReason.all
  end

  # GET /transfer_reasons/1 or /transfer_reasons/1.json
  def show
  end

  # GET /transfer_reasons/new
  def new
    @transfer_reason = TransferReason.new
  end

  # GET /transfer_reasons/1/edit
  def edit
  end

  # POST /transfer_reasons or /transfer_reasons.json
  def create
    @transfer_reason = TransferReason.new(transfer_reason_params)

    respond_to do |format|
      if @transfer_reason.save
        format.html { redirect_to transfer_reason_url(@transfer_reason), notice: "Transfer reason was successfully created." }
        format.json { render :show, status: :created, location: @transfer_reason }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfer_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfer_reasons/1 or /transfer_reasons/1.json
  def update
    respond_to do |format|
      if @transfer_reason.update(transfer_reason_params)
        format.html { redirect_to transfer_reason_url(@transfer_reason), notice: "Transfer reason was successfully updated." }
        format.json { render :show, status: :ok, location: @transfer_reason }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfer_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfer_reasons/1 or /transfer_reasons/1.json
  def destroy
    @transfer_reason.destroy

    respond_to do |format|
      format.html { redirect_to transfer_reasons_url, notice: "Transfer reason was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer_reason
      @transfer_reason = TransferReason.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transfer_reason_params
      params.require(:transfer_reason).permit(:uid, :name, :description, :status, :account_id)
    end
end
