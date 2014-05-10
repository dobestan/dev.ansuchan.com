class ShareLinksController < ApplicationController
  def index
  end

  def show
    @share_link = ShareLink.find(params[:id])
  end

  def new
    @share_link = ShareLink.new()
  end

  def create
    @share_link = ShareLink.new(share_link_params)
    if @share_link.save
      # Success to Save
      redirect_to @share_link
    else
      # Failed to Save
      flash[:error] = "failed to save."
      render 'new'
    end
  end

  private
    def share_link_params
      params.require(:share_link).permit(:original_url, :shorten_url)
    end
end
