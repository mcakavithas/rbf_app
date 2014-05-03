class FoliosController < ApplicationController
  def index
  	@folios = Folio.all
  end
end
