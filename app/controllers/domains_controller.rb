class DomainsController < ApplicationController
  before_action :require_signin, only: [:index]
  # before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :set_user
  respond_to :js, only: [:destroy]

  def index
    @domains = @user.domains
    # binding.pry
  end

  def new
    @domain = @user.domains.new
  end

  def create
    @domain = @user.domains.new(domain_params)
    if @domain.save
      redirect_to domains_path
    else
      render :new
    end
  end

  def destroy
    # finish this
    @domains = @user.domains
    @domain = @user.domains.find(params[:id])
    @domain.destroy

    respond_with(@domain) do |format|
      format.html { redirect_to domains_path }
    end
  end

  def edit
    @domain = @user.domains.find(params[:id])
  end

  def update
    @domain = @user.domains.find(params[:id])
      if @domain.update(domain_params)
        redirect_to domains_path
      else
        render :edit
      end
  end

private

  def set_user
    @user = User.find(current_user.id)
  end

  def domain_params
    params.require(:domain).permit(:url)
  end

end
