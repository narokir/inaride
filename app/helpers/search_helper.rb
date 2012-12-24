module SearchHelper
  
  def search_status
    if params[:origin].blank? && params[:destination].blank? && params[:date].blank?
      notice = 'It looks like you forgot to mention origin or destination. Try again -'
    end
  end
  
end

