class ProductsController < ApplicationController

  before_filter :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @company = Company.find(params[:company_id])
    @products = Product.where(company_id: params[:company_id]).order("id").page(params[:page]).per_page(20)
    render_404
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.create(product_params)
    redirect_to company_product_path(params[:company_id], @product)
  end

  def update
    @product.update(product_params)
    if @product.errors.empty?
      redirect_to company_product_path(params[:company_id], @product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to company_path(params[:company_id])
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :company_id, :photo, :picture)
    end

    def find_product
      @product = Product.find(params[:id])
    end

end
