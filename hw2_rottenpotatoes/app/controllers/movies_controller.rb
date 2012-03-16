class MoviesController < ApplicationController
  
  before_filter :set_movie_params, :only => [:index]

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    
    # clear session data
    if params[:clear]
      session.clear
      return redirect_to movies_path
    end
    
    @movies = Movie.all
    @all_ratings = @movies.collect{|m| m.rating}.uniq
    
    ratings = @movies_params[:ratings].keys
    sort = @movies_params[:sort].keys
    ratings.delete("all")
    sort.delete("all")
    
  
    unless ratings.empty?
      @movies = Movie.find_all_by_rating(ratings)
    end
    unless sort.empty?
      @movies = @movies.sort{|a,b| a.send(sort.first) <=> b.send(sort.first)}
    end
  
    if !params[:sort] and !session[:sort] and !params[:ratings] and !session[:ratings]
      return
    else
      if params[:sort] and params[:ratings]
        return
      else
        redirect_to movies_path(@movies_params)
      end
    end
  
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
  
  private
  
  def set_movie_params
    # session[:sort] = params[:sort] ? params[:sort] : session[:sort]
    # session[:ratings] = params[:ratings] ? params[:ratings] : session[:ratings]
    
    movies_params = {}
    movies_params[:sort] = {'all' => 1}
    movies_params[:ratings] = {'all' => 1}
    if params[:sort]
      movies_params[:sort] = params[:sort]
    # elsif session[:sort]
      # movies_params[:sort] = session[:sort]
    end
    if params[:ratings]
      movies_params[:ratings] = params[:ratings]
    # elsif session[:ratings]
      # movies_params[:ratings] = session[:ratings]
    end
    @movies_params = movies_params
  end

end