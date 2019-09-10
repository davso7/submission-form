class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  # GET /forms.json
  def index
    redirect_to '/500.html' and return
    @forms = Form.all
  end

  # # GET /forms/1
  # # GET /forms/1.json
  # def show
  # end

  # GET /forms/new
  def new
    redirect_to '/404.html' and return if params[:auth_token].nil? || not_allowed_user
    @form = Form.new
    @form.user_id = user.id
  end

  # # GET /forms/1/edit
  # def edit
  # end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    # redirect_to '/404.html' and return if probably_hacking_id

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Usuario inscrito correctamente.' }
        #format.html { redirect_to "/forms/show/#{@form.id}", notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  # def update
  #   respond_to do |format|
  #     if @form.update(form_params)
  #       format.html { redirect_to @form, notice: 'Form was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @form }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @form.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /forms/1
  # # DELETE /forms/1.json
  # def destroy
  #   @form.destroy
  #   respond_to do |format|
  #     format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find_by(params[:id])
      redirect_to '/404.html' and return if @form.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:nombre, :apellidos, :cedula, :email, :telefono, :institucion, :cargo, :profesion, :user_id)
    end

    def not_allowed_user
      user.nil? || user.form
    end

    def user
      @user ||= User.find_by(auth_token: params[:auth_token])
    end

    def probably_hacking_id
      u = User.find_by(params[:form][:user_id])
      !u.nil?
    end
end
