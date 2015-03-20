class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :edit, :update, :destroy]
  
  def index 
    @keywords = Keyword.all  
  end

  def new 
    @keyword = Keyword.new 
  end

  def create
    @keyword = Keyword.new(keyword_params)  
    if @keyword.save
      flash[:notice] = "Keyword created."
      redirect_to keywords_path 
    else
      render 'new' #replacing render('keywords/new.html.erb')
    end
  end

  def show
    #@keyword.grab_twitts  //runs this method when show action loads
  end

  def edit 
    @keyword = Keyword.find(params[:id])
  end

  def update 
    @keyword = Keyword.find(params[:id])
    if @keyword.update(keyword_params)
     flash[:notice] = "Keyword updated."
      redirect_to keyword_path(@keyword)
    else
      render 'edit'
    end
  end

 def destroy 
    @keyword = Keyword.find(params[:id])
    @keyword.destroy
     flash[:notice] = "keyword Deleted"
    redirect_to keywords_path
 end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = Keyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_params
      params.require(:keyword).permit(:word,:image)
    end
end