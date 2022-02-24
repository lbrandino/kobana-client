class PixsController < ApplicationController
  before_action :set_pix, only: %i[ show edit update destroy ]
  
  def index
    @pixs = Kobana::IndexPix.new.call  
  end
  
  def show; end

  def new; end

  def create
    response = Kobana::CreatePix.new(params).call
    response_to(response,t(:pix_saved))
  end

  def edit; end

  def cancel
    response = Kobana::CancelPix.new.call(id:params[:id])
    response_to(response,t(:pix_caceled))
  end

  def destroy
    response = Kobana::DestroyPix.new.call(id:params[:id])
     response_to(response,t(:pix_deleted))
  end

  def response_to(response,notice)
     if response.success?
        redirect_to pixs_path, notice: notice
    else
        flash[:alert] = response.errors
        redirect_to pixs_path
    end 
  end

   private
    def set_pix
      response = Kobana::ShowPix.new.call(id:params[:id])
      unless response.success?        
        flash[:alert] = response.errors
        redirect_to pixs_path
      end
      
      @pix = response.pix
    end
end
