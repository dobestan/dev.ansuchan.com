class ShareLinksController < ApplicationController
  include ShareLinksHelper

  def index
  end

  def show
    @share_link = ShareLink.find(params[:id])
  end

  def redirect
    share_link = ShareLink.find_by(shorten_url: params[:shorten_url])
    redirect_to share_link.original_url
  end

  def new
    @share_link = ShareLink.new()
  end

  def create
    @share_link = ShareLink.new(share_link_params)
    @share_link.shorten_url = generate_short_string if @share_link.shorten_url.empty?

    # Save to DB
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
