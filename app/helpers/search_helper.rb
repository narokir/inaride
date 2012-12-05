module SearchHelper
  def no_search_params
    if params[:origin].blank? && params[:destination].blank?
      notice = 'You did not provide an origin of destination'
    else
      notice = 'Here you go:'
    end
  end
end
