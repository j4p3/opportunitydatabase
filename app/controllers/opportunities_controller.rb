class OpportunitiesController < ApplicationController
    has_scope :track
    has_scope :city
    has_scope :salary

  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.create(opportunity_params)
    if @opportunity.save
      flash[:success] = "Thanks for sharing!"
      redirect_to @opportunity
    else
      render 'new'
    end
  end

  def destroy
  end

  def index
    query = Opportunity.scoped
    query = query.track(params[:track]) if params[:track]
    query = query.city(params[:city]) if params[:city]
    query = query.salary(params[:salary]) if params[:salary]
    @opportunities = query.all
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end

  private
    def opportunity_params
        params.require(:opportunity).permit(:position, :track, :company, :location, :salary, :contact, :link, :notes)
    end
end
