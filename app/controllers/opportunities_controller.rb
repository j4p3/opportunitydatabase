class OpportunitiesController < ApplicationController
    before_filter :correct_user, only: [:edit, :update]
    has_scope :track
    has_scope :city
    has_scope :salary

  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.create(opportunity_params)
    @opportunity.user_id = current_user.id
    if @opportunity.save
      flash[:success] = "Thanks for sharing!"
      redirect_to @opportunity
    else
      render 'new'
    end
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  def update
    @opportunity = Opportunity.find(params[:id])
    if @opportunity.update_attributes(opportunity_params)
      flash[:success] = "Opportunity updated"
      redirect_to opportunities_path
    else
      render 'edit'
    end
  end

  def index
    query = Opportunity.scoped
    query = query.track(params[:track]) if params[:track]
    query = query.city(params[:city]) if params[:city]
    query = query.salary(params[:salary].to_i) if params[:salary]
    @opportunities = query.all

    respond_to do |format|
      format.html
      format.json { render :json => @opportunities }
    end
  end

  def show
    @opportunity = Opportunity.find(params[:id])
    @user = User.find(@opportunity.user_id)
  end

  def destroy
    Opportunity.find(params[:id]).destroy
    flash[:success] = "Opportunity deleted."
    redirect_to opportunities_path
  end

  private
    def opportunity_params
        params.require(:opportunity).permit(:position, :track, :company, :location, :salary, :contact, :link, :notes)
    end

    def correct_user
      opportunity = Opportunity.find(params[:id])
      redirect_to(opportunities_path) unless current_user?(opportunity.user_id)
    end
end
