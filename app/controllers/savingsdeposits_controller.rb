class SavingsdepositsController < ApplicationController

  before_filter :authenticate_user!

 autocomplete  :customer, :first_name, :display_value => :first_name, :full => true
 
  def index
      @savingsdeposits = Savingsdeposit.all
  end

  def pending
    @savingsdeposits = Savingsdeposit.all
  end

 def approve
   @savingsdeposit = Savingsdeposit.find(params[:id])
  end

  def new
      @savingsdeposit = Savingsdeposit.new
  end

  def create
    @savingsdeposit = Savingsdeposit.new(params[:savingsdeposit])
    if @savingsdeposit.save 
       flash[:success] = "Welcome!"
      redirect_to savingsdeposits_path          
     else
      flash[:alert] = "SD not added"
       render 'new'
     end    
  end

 def show
   @savingsdeposit = Savingsdeposit.find(params[:id])
   @customer = Customer.all
    #@savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
   @savingsdeposittransaction = Savingsdeposittransaction.all
 end

 def edit
   @savingsdeposit = Savingsdeposit.find(params[:id])
 end

   def update
      @savingsdeposit = Savingsdeposit.find(params[:id])
      if @savingsdeposit.update_attributes(params[:savingsdeposit])
        flash[:success] = "Profile updated successfully"
        redirect_to savingsdeposits_path(@savingsdeposit)
      else
         flash.now[:error] = "Cannot updating your profile"
         render 'edit'
      end
    end


def activate
  @savingsdeposit = Savingsdeposit.find(params[:id]) 
  @savingsdeposit.update_attributes!(:status => 'approved')
  redirect_to approve_savingsdeposit_path(@savingsdeposit)
  # redirect to users#followers passing current_user
end 



end