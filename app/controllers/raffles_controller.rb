class RafflesController < ApplicationController
  # before_filter :admin_user, only: [:edit, :update, :destroy]
  before_action :admin_user, except: [:index, :show, :confirm]
  before_action :set_raffle, only: [:show, :edit, :update, :destroy]


  helper_method :confirm, :random, :count
  # GET /raffles
  # GET /raffles.json
  def index
    @raffles = Raffle.all
  end

  # GET /raffles/1
  # GET /raffles/1.json
  def show
    @count = @raffle.tickets.length
  end

  # GET /raffles/new
  def new
    @raffle = Raffle.new
  end

  # GET /raffles/1/edit
  def edit
  end

  # POST /raffles
  # POST /raffles.json
  def create
    @raffle = Raffle.new(raffle_params)

    respond_to do |format|
      if @raffle.save
        format.html { redirect_to @raffle, notice: 'Raffle was successfully created.' }
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raffles/1
  # PATCH/PUT /raffles/1.json
  def update
    respond_to do |format|
      if @raffle.update(raffle_params)
        format.html { redirect_to @raffle, notice: 'Raffle was successfully updated.' }
        format.json { render :show, status: :ok, location: @raffle }
      else
        format.html { render :edit }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    authorize
    @raffle= Raffle.find(params[:raffle_id])
    @ticket = Ticket.create(user_id: current_user.id, raffle_id: params[:raffle_id])
  end


def winner
  @raf = Raffle.find(params[:raffle_id])
  @winner_ticket = @raf.tickets.sample
  @winner = @winner_ticket.user
end


  # DELETE /raffles/1
  # DELETE /raffles/1.json
  def destroy
    @raffle.destroy
    respond_to do |format|
      format.html { redirect_to raffles_url, notice: 'Raffle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raffle
      @raffle = Raffle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raffle_params
      params.require(:raffle).permit(:title, :description, :prize, :max_tickets)
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end
  end
