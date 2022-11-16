class BandsController < ApplicationController

    before_action :set_band, only: [:show, :edit, :update, :destroy]

    def index
        @bands = Band.all
        render :index
    end

    def show
        set_band
        if @band
            render :show
        else
            redirect_to bands_url
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_url
        else
            render :new
        end
    end

    def update
        set_band
    end

    def destroy
        set_band
        @band.destroy
        redirect_to bands_url
    end

    def set_band
        @band = Band.find_by(id: params[:id])
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end