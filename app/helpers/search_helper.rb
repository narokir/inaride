module SearchHelper
  
  def no_search_params
    if params[:origin].blank? && params[:destination].blank?
      notice = 'You did not provide an origin or destination'
    else
      "#{params[:origin]},#{params[:destination]},#{params[:date]}"
    end
  end
  
end

