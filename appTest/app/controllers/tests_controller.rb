class TestsController < ApplicationController
  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tests }
    end
  end

  # GET /tests
  # GET /tests.json
  def get_tests_by_professor
    test = Test.new
    @tests = Test.find_by_sql(test.find_tests_by_professor_sql(params[:id]))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tests }
    end
  end

  # GET /tests/1/questions.json
  def show_questions
    @test = Test.find(params[:id])
    if @test
      respond_to do |format|
        format.json { render json: @test.questions.order('id ASC') }
      end
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @test = Test.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/1/time_remainig.json
  def time_remaining
    test = Test.find(params[:id])
    time_remaining = 0
    if test.estado == 1
      time_remaining = 1
=begin
      final = (test.fecha + test.duracion.minutes)
      time_remaining =  final - DateTime.now
      if time_remaining
        time_remaining = 0
      end
=end
    end

    respond_to do |format|
      format.json { render json: time_remaining }
    end
  end

  # GET /tests/new
  # GET /tests/new.json
  def new
    @test = Test.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/1/edit
  def edit
    @test = Test.find(params[:id])
  end

  # POST /tests
  # POST /tests.json
  def create
    if not params[:authenticity_token].nil?
      # Vista local
      @test = Test.new(params[:test])
    else
      # Solicitud remota
      @test = Test.new({
         :group_id => params[:group_id],
         :descripcion => params[:descripcion],
         :fecha => params[:fecha],
         :estado => params[:estado],
         :duracion => params[:duracion],
         :total_puntos => params[:total_puntos],
         :comentarios => params[:comentarios]
       })
    end

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render json: @test, status: :created, location: @test }
      else
        format.html { render action: "new" }
        format.json { render json: @test.errors }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.json
  def update
    @test = Test.find(params[:id])
    exito = false
    if not params[:authenticity_token].nil?
      # Vista localis
      exito = @test.update_attributes(params[:test])
    else
      # Solicitud remota
      exito = @test.update_attributes({
          :group_id => params[:group_id],
          :descripcion => params[:descripcion],
          :fecha => params[:fecha],
          :estado => params[:estado],
          :duracion => params[:duracion],
          :total_puntos => params[:total_puntos],
          :comentarios => params[:comentarios]
       })
    end
    respond_to do |format|
      if exito
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test = Test.find(params[:id])
    begin
      @test.destroy

      respond_to do |format|
        format.html { redirect_to tests_url }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      respond_to do |format|
        format.json { render json: e.message }
      end
    end
  end

  # POST tests/1/question.json
  def add_question
    @test = Test.find(params[:id])
    begin
      @question = Question.new({
       :test => @test,
       :pregunta => params[:pregunta],
       :respuesta => params[:respuesta],
       :valor => params[:valor]
        })
      respond_to do |format|
        if @question.save
          format.json { render json: @question, status: :created}
        else
          format.json { render json: @question.errors }
        end
      end
    rescue Exception => e
      respond_to do |format|
        format.json { render json: e.message  }
      end
    end
  end

  # DELETE tests/1/questions/1.json
  def remove_question
    test = Test.find(params[:id])
    if test
      question = test.questions.find(params[:question_id])
      if question
        begin
          question.destroy
          respond_to do |format|
            format.json { head :no_content }
          end
        rescue ActiveRecord::DeleteRestrictionError => e
          respond_to do |format|
            format.json { render json: e.message }
          end
        end
      end
    end
  end

  # GET tests/1/students/1/answers.json
  def show_answers_by_student
    test = Test.find(params[:id])
    if test
      answers = test.answers.where({ :student_id => params[:student_id] })
      respond_to do |format|
        format.json { render json: answers }
      end
    end
  end

  # POST tests/1/answers.json
  def add_answer
    begin
      operacion_exitosa = true
      registro_borrado = false
      if params[:id] == 0
        if not params[:respuesta].blank?
          @answer = Answer.new({
                         :test_id => params[:test_id],
                         :question_id => params[:question_id],
                         :student_id => params[:student_id],
                         :respuesta => params[:respuesta]
                     })
          operacion_exitosa = @answer.save
        end
      else
        @answer = Answer.find(params[:id])
        if params[:respuesta].blank?
          @answer.destroy
          registro_borrado = true
        else
          @answer.respuesta = params[:respuesta]
          operacion_exitosa = @answer.save
        end
      end
      if registro_borrado == false
        respond_to do |format|
          if operacion_exitosa
            format.json { render json: @answer, status: :created}
          else
            format.json { render json: @answer.errors }
          end
        end
      else
        respond_to do |format|
          format.json { head :no_content }
        end
      end
    end
  rescue Exception => e
    respond_to do |format|
     format.json { render json: e.message}
    end
  end

end
