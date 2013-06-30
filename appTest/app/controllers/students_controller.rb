class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/groups.json
  def show_groups
    @student = Student.find(params[:id])
    if @student
      respond_to do |format|
        format.json { render json: @student.groups.order('id DESC') }
      end
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    if not params[:authenticity_token].nil?
      # Vista local
      @student = Student.new(params[:student])
    else
      # Solicitud remota
      @student = Student.new({
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
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, :status => :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    exito = false
    if !params[:student].empty? and !params[:student].blank?
      # Vista localis
      exito = @student.update_attributes(params[:student])
    else
      # Solicitud remota
      exito = @student.update_attributes({
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
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    begin
      @student.destroy
      respond_to do |format|
        format.html { redirect_to students_url }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      respond_to do |format|
        format.json { render json: e.message }
      end
    end
  end

  # GET /students/1/tests.json
  def show_tests
    test_model = Test.new()
    @tests = Test.find_by_sql(test_model.find_tests_by_student_sql(params[:id]))
    if @tests
      respond_to do |format|
        format.json { render json: @tests }
      end
    end
  end
end
