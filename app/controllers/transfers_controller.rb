class TransfersController < ApplicationController
  #load_and_authorize_resource
  before_action :authenticate_account!
  before_action :set_transfer, only: %i[ show edit update destroy download ]
  load_and_authorize_resource :except => [:get_cancel, :post_cancel]

  layout "dashboard"

  # GET /transfers or /transfers.json
  def index
    @transfers = Transfer.all
  end

  # GET /transfers/1 or /transfers/1.json
  def show
    puts "SHOW: #{@transfer.inspect}"
  end

  # GET /transfers/new
  def new
    @countries = Country.all
    @transfer_reasons = TransferReason.all
    @currencies = Currency.all
    @identity_document_types = IdentityDocumentType.all
    @transfer = Transfer.new
  end


  # GET /transfers/1/edit
  def edit
    @currencies = Currency.all
    @identity_document_types = IdentityDocumentType.all
  end

  def search

    
    mtcn = params[:mtcn] if params[:mtcn].present?
    @selected_mtcn = mtcn if mtcn.present?
    @transfers = Transfer.search_by_mtcn(mtcn)#.where.not(status: "Actif")
    @total_amount_incl_tax = @transfers.sum(:amount_incl_tax)
    @total_gross_profit = @transfers.sum(:gross_profit)
    @total_net_profit = @transfers.sum(:net_profit)


  end

  # POST /transfers or /transfers.json
  def create
    @transfer = current_account.transfers.build(transfer_params)

    respond_to do |format|
      if @transfer.save
        @transfers = Transfer.all
        format.html { redirect_to show_transfer_path(@transfer), notice: "Transfer was successfully created." }
        format.json { render :show, status: :created, location: @transfer }
        #format.js

      else
        @countries = Country.all
    @transfer_reasons = TransferReason.all
    @currencies = Currency.all
    @identity_document_types = IdentityDocumentType.all

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
        format.js
      end
    end
    

  end

  # PATCH/PUT /transfers/1 or /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to transfert_url(@transfer), notice: "Transfert was successfully updated." }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_cancel
    @transfer = Transfer.find_by(uid: params[:uid])
    
  end

  def post_cancel
    @transfer = Transfer.find_by(uid: params[:uid])
    #@transfer.update_column(:paid, "Annulée")
    @transfer.update_column(:status, "Annulé")

    respond_to do |format|
      format.html { redirect_to transfers_url, notice: "Transfert annulé avec succès." }
      format.json { head :no_content }
    end
  end


  def download

       

        respond_to do |format|

            format.html

            format.pdf do

                render pdf: "Transfer No. #{@transfer.uid}",

                page_size: 'A4',

                template: "transfers/pdf.html.erb",

                layout: "pdf.html.erb",

                orientation: "Portrait", #Landscape

                lowquality: true,

                zoom: 1,

                dpi: 75

            end

        end

    end


  def delete
    @transfer = Transfer.find_by(uid: params[:transfer_id])
  end

  # DELETE /transfers/1 or /transfers/1.json
  def destroy
    @transfer.destroy

    respond_to do |format|
      format.html { redirect_to transfers_url, notice: "Transfer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find_by(uid: params[:uid])
    end

    # Only allow a list of trusted parameters through.
    def transfer_params
      params.require(:transfer).permit(:transfer_reason_id, :amount_incl_tax,:transfer_currency_id, :standard_rate, :standard_rate_amount, :withdrawal_currency_id, :sell_rate, :sell_rate_amount, :gross_profit, :expense, :net_profit,  :sender_last_name, :sender_first_name, :sender_gender, :sender_phone, :sender_identity_document_type_id, :sender_identity_document_code, :sender_country_id, :sender_city, :beneficiary_last_name, :beneficiary_first_name, :beneficiary_gender, :beneficiary_phone, :beneficiary_country_id, :beneficiary_city)
    end
end
