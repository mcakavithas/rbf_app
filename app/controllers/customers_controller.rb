class CustomersController < ApplicationController
  def new
     @customer = Customer.new
     @folio = @customer.folios.build
     @savingsdeposit= @customer.savingsdeposits.build

  end

  def create
    @customer = Customer.new(params[:customer]) 
      #@customer.date_folio_allocation_date = Time.now
     if @customer.save 
       flash[:success] = "Welcome!"
      redirect_to customer_path(@customer)            
     else
      flash[:alert] = "Customer not added"
       render 'new'
     end    
  end

  def index
      @customers = Customer.all 
     @customers = Customer.where("first_name LIKE ? OR last_name LIKE ?  OR code LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%" ).paginate(
      page: params[:page], per_page: 5)
  end

 def edit
 @customer = Customer.find(params[:id])
 end

  def update
  @customer = Customer.find(params[:id])
  if @customer.update_attributes(params[:customer])
  flash[:success] = "Customer updated successfully"
  redirect_to customers_path(@customer)
  else
  flash[:alert] = "Customer updated failed"
  render 'edit'
  end
  end

  def destroy
     @customer = Customer.find(params[:id])
     @customer.destroy
     flash[:notice] = "Customer deleted successfully"
     redirect_to customers_path
  end

  def show
     @customer = Customer.find(params[:id])
  end
end