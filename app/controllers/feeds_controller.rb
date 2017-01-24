class FeedsController < ApplicationController

  # GET /feeds
  def index
    @feeds = Feed.all
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # POST /feeds
  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      redirect_to feeds_path, notice: "#{@feed.name} was successfully added to the feed list."
    else
      render :new
    end
  end

  # GET /feeds/id/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # GET /feeds/id
  def show
    @feed = Feed.find(params[:id])
  end

  # PUT /feeds/id
  def update
    @feed = Feed.find(params[:id])

    if @feed.update(feed_params)
      redirect_to @feed, notice: "#{@feed.name} was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /feeds/id
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    redirect_to feeds_path, notice: "#{@feed.name} was successfully removed from the feed list."
  end

  private

    # Insure params
    def feed_params
      params.require(:feed).permit(:name, :url)
    end
end
