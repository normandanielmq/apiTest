class ProfessorsController < ApplicationController
  # GET /professors
  # GET /professors.json
  def index
    @professors = Professor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @professors }
    end
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
    @professor = Professor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @professor }
    end
  end

  # GET /professors/1/groups.json
  def show_groups
    @professor = Professor.find(params[:id])
    if @professor
      respond_to do |format|
        format.json { render json: @professor.groups.order('id DESC') }
      end
    end
  end

  # GET /professors/1/courses.json
  def show_courses
    @professor = Professor.find(params[:id])
    if @professor
      respond_to do |format|
        format.json { render json: @professor.courses.order(:nombre) }
      end
    end
  end

  # GET /professors/new
  # GET /professors/new.json
  def new
    @professor = Professor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @professor }
    end
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  # POST /professors.json
  def create
    if not params[:authenticity_token].nil?
      # Vista local
      @professor = Professor.new(params[:professor])
    else
      # Solicitud remota
      @professor = Professor.new({
          :cedula => params[:Cedula],
          :nombre => params[:Nombre],
          :apellidos => params[:Apellidos],
          :username => params[:UserName],
          :password => params[:Password],
          :rol => params[:Rol],
          :email => params[:Email]
        })
    end

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
        format.json { render json: @professor, status: :created, location: @professor }
      else
        format.html { render action: "new" }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /professors/1
  # PUT /professors/1.json
  def update
    @professor = Professor.find(params[:id])
    exito = false
    if not params[:authenticity_token].nil?
      # Vista localis
      exito = @professor.update_attributes(params[:professor])
    else
      # Solicitud remota
      exito = @professor.update_attributes({
          :cedula => params[:Cedula],
          :nombre => params[:Nombre],
          :apellidos => params[:Apellidos],
          :username => params[:UserName],
          :password => params[:Password],
          :rol => params[:Rol],
          :email => params[:Email]
        })
    end
    respond_to do |format|
      if exito
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor = Professor.find(params[:id])
    begin
      @professor.destroy
      respond_to do |format|
        format.html { redirect_to professors_url }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      respond_to do |format|
        format.json { render json: e.message }
      end
    end
  end
end
