class SavingsdeposittransactionsController < ApplicationController
  def index
    @savingsdeposittransactions = Savingsdeposittransaction.all
  end

  def new
      @savingsdeposittransaction = Savingsdeposittransaction.new
      @savingsdeposittransaction.savingsdeposit_id = params[:id]
 
  end

  def create
     @savingsdeposittransaction = Savingsdeposittransaction.new(params[:savingsdeposittransaction])
    if @savingsdeposittransaction.save 
       flash[:success] = "Welcome!"
     # redirect_to savingsdeposits_path  
      redirect_to savingsdeposits_path
     else
      flash[:alert] = "SD not added"
       render 'new'
     end    
   end

  
  def show
     @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id])
     #@savingsdeposittransaction = Savingsdeposittransaction.all
     #@savingsdeposit = @savingsdeposit.all
  end

  def activate
  @savingsdeposittransaction = Savingsdeposittransaction.find(params[:id]) 
  @savingsdeposittransaction.update_attributes!(:status => 'approved')
  redirect_to savingsdeposittransaction_path(@savingsdeposittransaction)
  # redirect to users#followers passing current_user
end 

end
