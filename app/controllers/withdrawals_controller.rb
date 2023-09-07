class WithdrawalsController < ApplicationController
   load_and_authorize_resource
   before_action :authenticate_account!

  before_action :set_withdrawal, only: %i[ show edit update destroy ]
  layout "dashboard"

  
  # GET /withdrawals or /withdrawals.json
  def index
    @withdrawals = Withdrawal.all
  end

  # GET /withdrawals/1 or /withdrawals/1.json
  def show
  end

  # GET /withdrawals/new
  def new
    @identity_document_types = IdentityDocumentType.all
    transfer = Transfer.find_by(uid: params[:transfer])

    @withdrawal = transfer.build_withdrawal()
    #@withdrawal = Withdrawal.new
  end

  # GET /withdrawals/1/edit
  def edit
  end

  # POST /withdrawals or /withdrawals.json
  def create

    

    @withdrawal = current_account.withdrawals.build(withdrawal_params)
    transfer = Transfer.find(@withdrawal.transfer_id)
    @withdrawal.amount_incl_tax = transfer.amount_incl_tax

    #Update transfer
    
    transfer.update_column(:withdrawal_date, Date.today)
    transfer.update_column(:status, "Retiré")

    
    respond_to do |format|
      if @withdrawal.save
        format.html { redirect_to withdrawals_path, notice: "Withdrawal was successfully created." }
        format.json { render :show, status: :created, location: @withdrawal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @withdrawal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withdrawals/1 or /withdrawals/1.json
  def update
    respond_to do |format|
      if @withdrawal.update(withdrawal_params)
        format.html { redirect_to withdrawal_url(@withdrawal), notice: "Withdrawal was successfully updated." }
        format.json { render :show, status: :ok, location: @withdrawal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @withdrawal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdrawals/1 or /withdrawals/1.json
  def destroy
    @withdrawal.destroy

    respond_to do |format|
      format.html { redirect_to withdrawals_url, notice: "Withdrawal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdrawal
      @withdrawal = Withdrawal.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def withdrawal_params
      params.require(:withdrawal).permit(:transfer_id, :beneficiary_identity_document_type_id, :beneficiary_identity_document_code, :beneficiary_identity_document)
    end
end
