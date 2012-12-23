module SearchHelper
  
  def search_status
    if params[:origin].blank? && params[:destination].blank? && params[:date].blank?
      notice = 'You forgot to mention a few things like origin, destination or date. Try again ->'
    else
     "#{params[:origin]}#{params[:destination]}#{params[:date]}"
     render :text => 'hi'
    end
  end
  
end

