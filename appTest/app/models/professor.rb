class Professor < ActiveRecord::Base
  validates :nombre, :username, :apellidos, :cedula,
            :email, :password, :rol, :presence=>true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :rol, :inclusion => { :in => 0..2 }
  validates :username, :email, :uniqueness => true

  has_many :groups, :dependent => :restrict
  has_many :courses, :through => :groups

  before_save :encriptar_password
  protected
  def encriptar_password
  	require '../appTest/security/encriptador.rb'
    self.password = Encriptador.new().encriptar(self.password)
  end
end
