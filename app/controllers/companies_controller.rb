class CompaniesController < ApplicationController

  before_filter :find_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @companies = Company.all.order("id").page(params[:page]).per_page(10)
  end

  def show
    redirect_to company_products_path(@company)
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.create(company_params)
    redirect_to company_path(@company)
  end

  def update
    @company.update(company_params)
    if @company.errors.empty?
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to action: :index
  end

  private

    def company_params
      params.require(:company).permit(:name, :description, :foundation)
    end

    def find_company
      @company = Company.find(params[:id])
    end

end
