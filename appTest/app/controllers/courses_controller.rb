class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/groups.json
  def show_groups
    @course = Course.find(params[:id])
    if @course
      respond_to do |format|
        format.json { render json: @course.groups.order('id DESC') }
      end
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    if not params[:authenticity_token].nil?
      # Vista local
      @course = Course.new(params[:course])
    else
      # Solicitud remota
      @course = Course.new({
          :codigo => params[:codigo],
          :nombre => params[:nombre],
          :descripcion => params[:descripcion]
        })
    end
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    exito = false
    if not params[:authenticity_token].nil?
      # Vista local
      exito = @course.update_attributes(params[:course])
    else
      exito = @course.update_attributes({
          :codigo => params[:codigo],
          :nombre => params[:nombre],
          :descripcion => params[:descripcion]
        })
    end
    respond_to do |format|
      if exito
        format.html { redirect_to @course, notice: 'course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    begin
      @course.destroy
      respond_to do |format|
        format.html { redirect_to courses_url }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      respond_to do |format|
        format.json { render json: e.message }
      end
    end
  end
end
