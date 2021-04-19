class GenresController < ApplicationController
    def new
        @genre = Genre.new
    end
    
    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to genre_path(@genre)
        end
    end
    
    def show
        @genre = Genre.find_by(id: params[:id])
    end

    def index
        @genres = Genre.all
    end

    def edit
        @genre = Genre.find_by(id: params[:id])
    end

    def update
        @genre = Genre.find_by(id: params[:id])
        @genre.update(genre_params)
        redirect_to genre_path(@genre)
    end

    private

    def genre_params
        params.require(:genre).permit(:name)
    end
    
end
