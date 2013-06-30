class UsersController < ApplicationController
  # POST /Login
  def login
  	status = ''
  	usuario = Usuario.new()
    persona = Usuario.get_persona_by_username_password(params[:UserName], params[:Password])
    if persona.nil?
  	  usuario.set_status('Invalid user')
 	  else
      usuario.set_id(persona.id)
      usuario.set_tipo(persona.class.name)
      usuario.set_username(persona.username)
      usuario.set_password(persona.password)
      usuario.set_rol(persona.rol)
      usuario.set_email(persona.email)
      usuario.set_nombre("#{persona.nombre} #{persona.apellidos}")
      usuario.set_status('OK')
  	end
    respond_to do |format|
      format.json { render json: usuario }
    end
  end

  def change_pass
    status = ''
    usuario = Usuario.new()
    persona = Usuario.get_persona_by_id_password(params[:id], params[:OldPassword])
    if persona.nil?
      usuario.set_status('Invalid user')
    else
      if persona.class.name == 'Students'
        estudiante = Student.find(params[:id])
        if estudiante
          estudiante.update_attribute(:password, params[:NewPassword])
        end
      else
          profesor = Professor.find(params[:id])
          if profesor
            profesor.update_attributes({ :password => params[:NewPassword] })
          end
      end
      usuario.set_status('OK')
    end
    respond_to do |format|
      format.json { render json: usuario }
    end
    end
  end
