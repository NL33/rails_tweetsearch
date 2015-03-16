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
    @keyword = Keyword.find(params[:id]) 
    render('keywords/show.html.erb')
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

    def keyword_params
      params.require(:keyword).permit(:word)
    end
end