class PixsController < ApplicationController
  before_action :set_pix, only: %i[ show edit update destroy ]
  
  def index
    @pixs = Kobana::IndexPix.new.call
  end

  def new; end

  def create
    response = Kobana::CreatePix.new(params).call
    if response.success?
        redirect_to pixs_path,notice: t(:pix_saved)
    else 
       flash[:alert] = response.errors
       redirect_to new_pix_path
    end 
  end

  def show; end

   private
    def set_pix
      response = Kobana::ShowPix.new.call(id:params[:id])
      unless response.success?
          flash[:alert] = response.errors
          redirect_to pixs_path
          p "passou"
      end
      
      @pix = response.pix
    end
end
