class HomeController < ApplicationController
  def index
  end

  def search
    if params[:search].blank?
      flash[:notice] = 'Please Supply a Search term'
    else
      @boards = Board.search_board params[:search]
      @pins = Pin.search_pin params[:search]
      if @boards.nil? && @pins.nil?
        flash[:notice] = 'No results Found matching your query'
      else
        flash[:notice] = 'Following are the search results'
        #@search = @board + @pin
      end
    end
  end
end
