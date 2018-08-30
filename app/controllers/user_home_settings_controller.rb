class UserHomeSettingsController < ApplicationController
  protect_from_forgery prepend: true
  before_action  :authenticate_user!, :set_user_home_setting, only: [:show, :edit, :update, :destroy]

  # GET /user_home_settings
  # GET /user_home_settings.json
  def index
    @user_home_settings = UserHomeSetting.all
  end

  def sort
    params[:user_home_setting].each_with_index do |id, index|
      UserHomeSetting.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def shown

    @user = current_user
    @all_settings = UserHomeSetting.where(user: @user.id)


    @all_settings.each do |s|
      if params[:user_home_setting_id]

        if params[:user_home_setting_id].include?(s.id.to_s)
          s.visibility = true
          s.save
        else
          s.visibility = false
          s.save
        end
      else
        s.visibility = false
        s.save
      end

    end

    head :ok
  end

  # GET /user_home_settings/1
  # GET /user_home_settings/1.json
  def show
  end

  # GET /user_home_settings/new
  def new
    @user_home_setting = UserHomeSetting.new
  end

  # GET /user_home_settings/1/edit
  def edit
  end

  # POST /user_home_settings
  # POST /user_home_settings.json
  def create
    @user_home_setting = UserHomeSetting.new(user_home_setting_params)

    respond_to do |format|
      if @user_home_setting.save
        format.html { redirect_to @user_home_setting, notice: 'User home setting was successfully created.' }
        format.json { render :show, status: :created, location: @user_home_setting }
      else
        format.html { render :new }
        format.json { render json: @user_home_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_home_settings/1
  # PATCH/PUT /user_home_settings/1.json
  def update
    respond_to do |format|
      if @user_home_setting.update(user_home_setting_params)
        format.html { redirect_to @user_home_setting, notice: 'User home setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_home_setting }
      else
        format.html { render :edit }
        format.json { render json: @user_home_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_home_settings/1
  # DELETE /user_home_settings/1.json
  def destroy
    @user_home_setting.destroy
    respond_to do |format|
      format.html { redirect_to user_home_settings_url, notice: 'User home setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_home_setting
      @user_home_setting = UserHomeSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_home_setting_params
      params.require(:user_home_setting).permit(:home_widget_id, :user_id, :position, :visibility)
    end
end
