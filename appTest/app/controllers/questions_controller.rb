class QuestionsController < ApplicationController
  # GET /questions/1/answers.json
   def show_answers
      question = Question.find(params[:id])
      if question
        respond_to do |format|
          format.json { render json: question.answers.order('id ASC') }
        end
      end
   end

  # PUT /questions/grade/1
  def grade
    answer = Answer.find(params[:id])
    if answer
      answer.valor_asignado = params[:valor_asignado]
      question = answer.question
      question.calificada = 1
      respond_to do |format|
        if answer.save and question.save
          format.json { render json: answer }
        else
          #format.json { render json: { codigo_error: 2, mensaje_error: answer.errors }
          format.json { render json: answer.errors }
        end
      end
    else
      respond_to { |format| format.json { render json: {codigo_error: 1, mensaje_error: "Respuesta no encontrada."} } }
    end
  end
end
