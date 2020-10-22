class PictureshotsController < ApplicationController
  before_action :set_pictureshot, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:edit, :update, :destroy]
 

     
  # GET /pictureshots
  # GET /pictureshots.json
  def index
    @pictureshots = Pictureshot.all.order("created_at DESC")
  end

  # GET /pictureshots/1
  # GET /pictureshots/1.json
  def show


    #@pictureshot = current_user.pictureshots.find (params[:id])
  end

  # GET /pictureshots/new
  def new
    @pictureshot = current_user.pictureshots.build

    
  end

  # GET /pictureshots/1/edit
  def edit
  end

  # POST /pictureshots
  # POST /pictureshots.json
  def create
  
    @pictureshot = current_user.pictureshots.build(pictureshot_params)
    respond_to do |format|
      if @pictureshot.save
        format.html { redirect_to @pictureshot, notice: 'Pictureshot was successfully created.' }
        format.json { render :show, status: :created, location: @pictureshot }
      else
        format.html { render :new }
        format.json { render json: @pictureshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictureshots/1
  # PATCH/PUT /pictureshots/1.json
  def update
    respond_to do |format|
      if @pictureshot.update(pictureshot_params)
        format.html { redirect_to @pictureshot, notice: 'Pictureshot was successfully updated.' }
        format.json { render :show, status: :ok, location: @pictureshot }
      else
        format.html { render :edit }
        format.json { render json: @pictureshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictureshots/1
  # DELETE /pictureshots/1.json
  def destroy
    @pictureshot.destroy
    respond_to do |format|
      format.html { redirect_to pictureshots_url, notice: 'Pictureshot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def like
    @pictureshot.liked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { render layout:false }
    end
  end

  def unlike
    @pictureshot.unliked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { render layout:false }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pictureshot
      @pictureshot = Pictureshot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pictureshot_params
      params.require(:pictureshot).permit(:title, :description, :user_id, :user_pictureshot)
    end
end
