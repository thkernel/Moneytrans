class SearchController < ApplicationController

  before_action :authenticate_account!


  #before_action :set_bank, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  

  def search_transfers

    
    mtcn = params[:mtcn] if params[:mtcn].present?
    @selected_mtcn = mtcn if mtcn.present?
    @transfers = Transfer.search(mtcn)#.where.not(status: "Actif")
    @total_amount_incl_tax = @transfers.sum(:amount_incl_tax)
    @total_gross_profit = @transfers.sum(:gross_profit)
    @total_net_profit = @transfers.sum(:net_profit)


  end

  def search_withdrawals

    
    #mtcn = params[:mtcn] if params[:mtcn].present?
    #@selected_mtcn = mtcn if mtcn.present?

    start_date = Date.parse(params[:start_date]) if params[:start_date].present? 
    end_date = Date.parse(params[:end_date]) if params[:end_date].present? 

    @selected_start_date = start_date if start_date.present?
    @selected_end_date = end_date if end_date.present?

    @withdrawals = Withdrawal.search(@selected_start_date,@selected_end_date )#.where.not(status: "Actif")

    @total = @withdrawals.sum(:amount_incl_tax)


  end

  def search_orders
    @accounts = Account.all


    start_date = Date.parse(params[:start_date]) if params[:start_date].present? 
    end_date = Date.parse(params[:end_date]) if params[:end_date].present? 
    account = params[:account] if params[:account].present?
    order_type = params[:order_type] if params[:order_type].present?
    payment_method = params[:payment_method] if params[:payment_method].present?
    
    puts "START DATE: #{start_date}"
    puts "END DATE: #{end_date}"
    puts "ACCOUNT: #{account}"
    puts "ORDER TYPE: #{order_type}"

     

    @selected_start_date = start_date if start_date.present?
    @selected_end_date = end_date if end_date.present?
    @selected_account = account if account.present?
    @selected_order_type = order_type if order_type.present?
    @selected_payment_method = payment_method if payment_method.present?


    @orders = Order.search(order_type, start_date, end_date, account, payment_method).where.not(status: "Annulée").where(social_case: false)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?
    personal_orders = Order.search(order_type, start_date, end_date, account, payment_method).where.not(status: "Annulée").where(social_case: true).where(customer_id: Customer.find_by(company_name: "LESAINTLOUIS").id) if Customer.find_by(company_name: "LESAINTLOUIS").present? #.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?
    
    unsold_foods = UnsoldFood.search(start_date, end_date).where.not(status: "Annulée")

    unsold_foods = UnsoldFood.where(id: unsold_foods.map(&:id)).joins(:food)
    
    @invoices = Invoice.search(start_date, end_date, account).where.not(status: "Annulée")#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?
   

    @all_orders = Order.search(order_type, start_date, end_date, account, payment_method).where.not(status: "Annulée")
    
    
    @card_recharges = RechargeFidelityCard.search(start_date, end_date).where.not(status: "Annulée")

    @total_espece = @orders.where(paid: "Payée").where(payment_method: "Espèce").sum(:total)
    @total_carte = @orders.where(paid: "Payée").where(payment_method: "Carte de fidélité").sum(:total)
    @total_impayee = @orders.where(paid: "Impayée").sum(:total)
    @total_card_recharges = @card_recharges.sum(:amount)
    @total_paid_invoices = @invoices.where(paid: "Payée").sum(:total)
    @total = @orders.sum(:total) + @total_paid_invoices

    

    @order_items = OrderItem.where(order_id: @orders.map(&:id)).joins(:food)
    @all_order_items = OrderItem.where(order_id: @all_orders.map(&:id)).joins(:food)
    all_order_drink_items = OrderItemDrink.where(order_id: @orders.map(&:id)).joins(:product)
    personal_order_items = OrderItem.where(order_id: personal_orders.map(&:id)).joins(:food) if personal_orders.present?
    
    @partial_food_chart_pie = @order_items.unscope(:order).group("foods.name").sum("quantity")
    @total_food_chart_pie = @all_order_items.unscope(:order).group("foods.name").sum("quantity")
    
    @total_unsold_food_pie = unsold_foods.unscope(:order).group("foods.name").sum("quantity")
    @personal_food_chart_pie = personal_order_items.unscope(:order).group("foods.name").sum("quantity") if personal_orders.present?
    @boissons_chart_pie = all_order_drink_items.unscope(:order).group("products.name").sum("quantity")
   

    


    #order_items = @orders.map { |order|  order.order_items}.flatten

    #puts "ORDERS ITEMS: #{order_items.inspect}"

    

  end

  def search_inventories
    @customers = Account.all

    inventory_date = Date.parse(params[:inventory_date]) if params[:inventory_date].present? 
    account = params[:account] if params[:account].present?
    
   

    @selected_inventory_date = inventory_date if inventory_date.present?
    @selected_account = account if account.present?


    @inventories =  Inventory.search(account,inventory_date)
  end

  def search_expenses
    @expense_types = ExpenseType.all

    start_date = Date.parse(params[:start_date]) if params[:start_date].present? 
    end_date = Date.parse(params[:end_date]) if params[:end_date].present? 
    expense_type = params[:expense_type] if params[:expense_type].present?
    
    puts "START DATE: #{start_date}"
    puts "END DATE: #{end_date}"
    #puts "ACCOUNT: #{account}"

     

    @selected_start_date = start_date if start_date.present?
    @selected_end_date = end_date if end_date.present?
    @selected_expense_type = expense_type if expense_type.present?

   
   


    @expenses =  Expense.search(start_date, end_date, expense_type)

    @total = @expenses.sum(:amount_incl_tax)
  end

  def search_customer_situations

    @customers = Customer.all



    start_date = Date.parse(params[:start_date]) if params[:start_date].present? 
    end_date = Date.parse(params[:end_date]) if params[:end_date].present? 
    customer = params[:customer] if params[:customer].present?
    order_type = params[:order_type] if params[:order_type].present?
    payment_status = params[:payment_status] if params[:payment_status].present?
    
    puts "START DATE: #{start_date}"
    puts "END DATE: #{end_date}"
    puts "CUSTOMER: #{customer}"
    #puts "ORDER TYPE: #{order_type}"

     

    @selected_start_date = start_date if start_date.present?
    @selected_end_date = end_date if end_date.present?
    @selected_customer = customer if customer.present?
    @selected_order_type = order_type if order_type.present?
    @selected_payment_status = payment_status if payment_status.present?


    @orders = Order.search_by_customer(order_type, start_date, end_date, customer, payment_status).where.not(status: "Annulée").where(social_case: false)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?
    #personal_orders = Order.search(order_type, start_date, end_date, account, payment_method).where.not(status: "Annulée").where(social_case: true).where(customer_id: Customer.find_by(company_name: "LESAINTLOUIS").id)#.paginate(:page => params[:page], :per_page => 15) #if Credit.search(bank_name).present?
    
    #unsold_foods = UnsoldFood.search(start_date, end_date).where.not(status: "Annulée")

    #unsold_foods = UnsoldFood.where(id: unsold_foods.map(&:id)).joins(:food)
    
   

    @all_orders = Order.search_by_customer(order_type, start_date, end_date, customer, payment_status).where.not(status: "Annulée")
    
    
    @card_recharges = RechargeFidelityCard.search(start_date, end_date).where.not(status: "Annulée")

    @total_espece = @orders.where(paid: "Payée").where(payment_method: "Espèce").sum(:total)
    @total_carte = @orders.where(paid: "Payée").where(payment_method: "Carte de fidélité").sum(:total)
    @total_impayee = @orders.where(paid: "Impayée").sum(:total)
    @total_card_recharges = @card_recharges.sum(:amount)

    @total = @orders.sum(:total)

    

    @order_items = OrderItem.where(order_id: @orders.map(&:id)).joins(:food)
    @all_order_items = OrderItem.where(order_id: @all_orders.map(&:id)).joins(:food)
    all_order_drink_items = OrderItemDrink.where(order_id: @orders.map(&:id)).joins(:product)
    #personal_order_items = OrderItem.where(order_id: personal_orders.map(&:id)).joins(:food)
    
    #@partial_food_chart_pie = @order_items.unscope(:order).group("foods.name").sum("quantity")
    @total_food_chart_pie = @all_order_items.unscope(:order).group("foods.name").sum("quantity")
    
    #@total_unsold_food_pie = unsold_foods.unscope(:order).group("foods.name").sum("quantity")
    #@personal_food_chart_pie = personal_order_items.unscope(:order).group("foods.name").sum("quantity")
    #@boissons_chart_pie = all_order_drink_items.unscope(:order).group("products.name").sum("quantity")
   

    


    #order_items = @orders.map { |order|  order.order_items}.flatten

    #puts "ORDERS ITEMS: #{order_items.inspect}"

  end

  

  
end


