class Usuario
  @id = 0
  @nombre = ''
  @username = ''
  @password = ''
  @tipo = ''
  @rol = 0
  @email = ''
  @status = ''


  def email
    @email
  end
  def set_email(value)
    @email = value
  end
  def nombre
  	@nombre
  end
  def set_nombre(value)
  	@nombre = value
  end
  def username
  	@username
  end
  def set_username(value)
  	@username = value
  end
  def rol
  	@rol
  end
  def set_rol(value)
  	@rol = value
  end
  def password
  	@password
  end
  def set_password(value)
  	@password = value
  end
  def status
  	@username
  end
  def set_username(value)
  	@username = value
  end

  def status
  	@status
  end
  def set_status(value)
  	@status = value
  end
  def id
  	@id
  end
  def set_id(value)
  	@id = value
  end
  def tipo
  	@tipo
  end
  def set_tipo(value)
  	@tipo = value
  end

  def initialize(id = 0, tipo = '', username = '', password = '')
		@username = username
		@password = password
		@id = id
		@tipo = tipo
  end

  def self.get_persona_by_username_password(searched_username, searched_password)
    require '../appTest/security/encriptador.rb'
  	searched_password = Encriptador.new().encriptar(searched_password)
    persona = Student.where(
  		username: searched_username,
  		password: searched_password).first()
  	if persona.nil?
  		persona = Professor.where(
  			username: searched_username,
  			password: searched_password).first()
  	end
    persona
  end

  def self.get_persona_by_id_password(id, searched_password)
    require '../appTest/security/encriptador.rb'
    searched_password = Encriptador.new().encriptar(searched_password)
    persona = Student.where(
        id: id,
        password: searched_password).first()
    if persona.nil?
      persona = Professor.where(
          id: id,
          password: searched_password).first()
    end
    persona
  end

end