class HomeWidgetsController < ApplicationController
  before_action :set_home_widget, only: [:show, :edit, :update, :destroy]

  # GET /home_widgets
  # GET /home_widgets.json
  def index
    @home_widgets = HomeWidget.all
  end

  # GET /home_widgets/1
  # GET /home_widgets/1.json
  def show
  end

  # GET /home_widgets/new
  def new
    @home_widget = HomeWidget.new
  end

  # GET /home_widgets/1/edit
  def edit
  end

  # POST /home_widgets
  # POST /home_widgets.json
  def create
    @home_widget = HomeWidget.new(home_widget_params)

    respond_to do |format|
      if @home_widget.save
        format.html { redirect_to @home_widget, notice: 'Home widget was successfully created.' }
        format.json { render :show, status: :created, location: @home_widget }
      else
        format.html { render :new }
        format.json { render json: @home_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_widgets/1
  # PATCH/PUT /home_widgets/1.json
  def update
    respond_to do |format|
      if @home_widget.update(home_widget_params)
        format.html { redirect_to @home_widget, notice: 'Home widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_widget }
      else
        format.html { render :edit }
        format.json { render json: @home_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_widgets/1
  # DELETE /home_widgets/1.json
  def destroy
    @home_widget.destroy
    respond_to do |format|
      format.html { redirect_to home_widgets_url, notice: 'Home widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_widget
      @home_widget = HomeWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_widget_params
      params.require(:home_widget).permit(:name, :description, :color, :default_visibility, :link)
    end
end
