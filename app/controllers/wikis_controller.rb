class WikisController < ApplicationController

def create
    @wiki = current_user.wikis.new(wiki_params)

    if @wiki.save
    redirect_to @wiki, notice: "Wiki was saved successfully."
    else
    flash[:error] = "Error creating wiki. Please try again."
    render :new
    end
end

def edit
  @wiki = Wiki.find(params[:id])
end


def show
  @wiki = Wiki.find(params[:id])
end


def index
  @wikis = Wiki.all
end


def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
       
    redirect_to @wiki, notice: "Wiki was updated successfully."
    else
    flash[:error] = "Error updating wiki. Please try again."
    redirect_to back
    end
end


def destroy
  
   @wiki = Wiki.find(params[:id])
  @wiki.destroy
  
  if @wiki.destroy
       flash[:notice] = "#{@wiki.title} was deleted successfully."
       redirect_to action: :index
     else
       flash[:error] = "There was an error deleting the wiki."
       render :show
     end
    
end

private

def wiki_params
params.require(:wiki).permit(:title, :body, :private)
end

end
