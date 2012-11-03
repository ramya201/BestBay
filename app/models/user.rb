class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:token_authenticatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :image, :last_name, :password
  has_many :items

  class << self
  def current_user=(user)
    Thread.current[:current_user] = user
  end

  def current_user
    Thread.current[:current_user]
  end
  end
  end
