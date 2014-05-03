class DailyproductsController < ApplicationController
	def show
	  @dailyproduct = Dailyproduct.find(params[:id])
	  @savingsdeposit = Savingsdeposit.all
end

end
