class Encriptador
	def encriptar(cadena, forzar_encriptado = false)
	  cadena_encriptada = cadena
	  if not cadena.nil? and (cadena.size != 32 or forzar_encriptado)
		  require 'digest'
	  	cadena_encriptada = Digest::MD5.hexdigest(cadena)
	  end
	  cadena_encriptada
	end
end