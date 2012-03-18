class MoviesController < ApplicationController
  require 'logger'

  $LOG = Logger.new('hw2.log', 5, 'daily')

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.<extension> by default
  end

  def index
    if (params[:sort] || params[:refresh])
      session[:sort] = params[:sort]
    end
    if (params[:ratings] || params[:refresh])
      session[:ratings] = params[:ratings]
    end
    @all_ratings = Movie.ratings
    @sort_column = session[:sort]
    @selected_ratings = session[:ratings] == nil ? nil : session[:ratings].keys
    @title_style = @sort_column == 'title' ? 'hilite' : ''
    @release_date_style = @sort_column == 'release_date' ? 'hilite' : ''
    
    # $LOG.debug("@sort_column = #{@sort_column}, @selected_ratings = #{@selected_ratings}");
       
    @movies = Movie.find(:all, {:conditions => @selected_ratings == nil ? nil : ["rating in (?)", @selected_ratings], :order => params[:sort]})
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end