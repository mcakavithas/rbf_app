class CustomersController < ApplicationController
  def index
    @customers = Customer.all 
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
        flash[:success] = "Customer successfully added"
      redirect_to customer_path(@customer)
    else
      flash[:alert] = "Customer not added"
      render 'new'
    end
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
