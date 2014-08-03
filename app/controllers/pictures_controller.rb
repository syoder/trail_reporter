class PicturesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
    before_action :set_picture
    before_action :set_report

    # GET /report/#/pictures
    # GET /report/#/pictures.json
    def index
      @pictures = @report.pictures.all
    end

    # GET /report/#/pictures/1
    # GET /report/#/pictures/1.json
    def show
    end

    # GET /report/#/pictures/new
    def new
      @picture = @report.pictures.new
    end

    # GET /report/#/pictures/1/edit
    def edit
    end

    # POST /report/#/pictures
    # POST /report/#/pictures.json
    def create
      @report.pictures.new(picture_params)

      respond_to do |format|
        if @picture.save
          format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
          format.json { render :show, status: :created, location: @picture }
        else
          format.html { render :new }
          format.json { render json: @picture.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /report/#/pictures/1
    # PATCH/PUT /report/#/pictures/1.json
    def update
    end

    # DELETE /report/#/pictures/1
    # DELETE /report/#/pictures/1.json
    def destroy
      @picture.destroy
      respond_to do |format|
        format.html { redirect_to report_pictures_url, notice: 'Picture was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:report_id])
    end

    def set_picture
      @picture = @report.pictures.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:picture)
    end

end
