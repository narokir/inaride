module SearchHelper
  
  def search_status
    if params[:origin].blank? && params[:destination].blank? && params[:date].blank?
      notice = 'It looks like you forgot to mention origin or destination. Try again -'
    end
  end
  
  def rides_found_msg
    if params[:origin].present? && params[:destination].present?
      render :text => "leaving from '#{params[:origin]}' going to '#{params[:destination]}'"
    elsif
      params[:destination].present?
      render :text => "goin to '#{params[:destination]}'"
    elsif
      params[:origin].present?
      render :text => "leaving from '#{params[:origin]}'"
    elsif
      params[:date].present?
      render :text => "On #{params[:date]}"
    elsif
      params[:origin].present? && params[:destination].present? && params[:date].present?
      render :text => "leaving from '#{params[:origin]}' going to '#{params[:destination]}' On '#{params[:date]}'"
    elsif
      params[:origin].blank? && params[:destination].blank?
      notice = 'It looks like you forgot to mention origin or destination.'
    end
    
  end
  
  def no_rides_found_msg
    if params[:origin].blank? && params[:destination].blank?
      notice = 'It looks like you forgot to mention origin or destination. Try again'
    elsif
      @rides.present?
    end
  end
  
end

