class SessionsController < ApplicationController
  layout :choose_layout
      
  private  
  def choose_layout  
    (request.xhr?) ? 'signin' : 'application'
  end
end