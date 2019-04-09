class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new(parent_id: params[:parent_id])
    @pages = Page.all
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private

  def set_page
    @page = Page.find_by slug: params[:slug]
  end

  def page_params
    params.require(:page).permit(:name, :title, :text, :slug, :parent_id)
  end
end
