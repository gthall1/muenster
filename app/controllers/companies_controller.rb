class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @new_company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    #Only to set up the form, NOT related to #update
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :industry, :description)
  end
end


