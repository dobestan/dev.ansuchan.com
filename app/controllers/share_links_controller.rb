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

  def edit
    @share_link = ShareLink.find(params[:id])
  end

  def update
    @share_link = ShareLink.find(params[:id])

    if share_link_params[:shorten_url].empty?
      new_shorten_url = generate_short_string
    else
      new_shorten_url = share_link_params[:shorten_url]
    end

    if @share_link.update(shorten_url: new_shorten_url)
      # Success to Update
      redirect_to @share_link
    else
      # Failed to Update
      render 'edit'
    end
  end

  private
    def share_link_params
      params.require(:share_link).permit(:original_url, :shorten_url)
    end
end
