# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  user_class      :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :username, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :name, 
  	:presence => { :message => "Não seja timido! Qual seu nome?"}, 
  	:length => { :minimum => 2, :maximum => 40, :message => 'Nome deve ter entre 2 e 40 caracteres.' }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, 
  	presence: { :message => "Poxa! Você precisa ter um email."}, 
  	format: { with: VALID_EMAIL_REGEX, :message => "Email invalido." }, 
  	uniqueness: { case_sensitive: false, :message => "Email ja registrado." }

  validates :username, 
  presence: { 
  	:message => "Escolha um nome de usuário." }, 
  uniqueness: { 
  	:message => "Nome de usuário ja esta sendo utilizado."}
  
  validates :password, 
  presence: { :message => "Escolha uma senha"}, 
  length: { minimum: 6, :message => "A senha escolhida e muito curta" }
  
  validates :password_confirmation, 
  presence: { :message => "Confirme sua senha." }
  #:if => { :passequal? } #lembrar de descobrir como implementar o :messages nessa condiçao
	
	def passequal?
		:password_confirmation == :password
	end
end
