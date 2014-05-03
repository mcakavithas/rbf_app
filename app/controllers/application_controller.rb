class ApplicationController < ActionController::Base
   protect_from_forgery
  def after_sign_in_path_for(user)
    if current_user
      home_index_path
      else
      :root
    end
  end
end