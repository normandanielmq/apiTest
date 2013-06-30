class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/students.json
  def show_students
    @group = Group.find(params[:id])
    if @group
      respond_to do |format|
        format.json { render json: @group.students.order(:apellidos) }
      end
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    if not params[:authenticity_token].nil?
      # Vista local
      @group = Group.new(params[:Group])
    else
      @group = Group.new({
        :course_id => params[:course_id],
        :cuatrimestre => params[:cuatrimestre],
        :professor_id => params[:professor_id],
        :numero_grupo => params[:numero_grupo]
      })
    end

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    exito = false
    if not params[:authenticity_token].nil?
      # Vista localis
      exito = @group.update_attributes(params[:Group])
    else
      # Solicitud remota
      exito = @group.update_attributes({
          :course_id => params[:course_id],
          :cuatrimestre => params[:cuatrimestre],
          :professor_id => params[:professor_id],
          :numero_grupo => params[:numero_grupo]
        })
    end
    respond_to do |format|
      if exito
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    begin
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      respond_to do |format|
        format.json { render json: e.message }
      end
    end
  end

  # GET groups/1/students/1.json
  def add_student_to_group
     @grupo = Group.find(params[:group_id])
     @student = Student.find(params[:student_id])

     if @student
      begin
        @grupo.students.push(@student)
        respond_to do |format|
          format.json { render json: @student }
        end
      rescue
        respond_to do |format|
          format.json { head :no_content }
        end
      end
     end
  end

  # DELETE groups/1/students/1.json
  def remove_student_from_group
     grupo = Group.find(params[:group_id])
     student = grupo.students.find(params[:student_id])

     if student
        grupo.students.delete(student)
        respond_to do |format|
          format.json { head :no_content }
        end
     end
  end
end
