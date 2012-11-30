# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  image                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#   roles                  :string(255)

class User < ActiveRecord::Base
  ROLES = %w[admin client]

  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:token_authenticatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles
  attr_accessible :first_name, :image, :last_name, :password
  has_many :items
  has_many :bids
  has_many :transactions
  validates_presence_of :first_name, :last_name

  def admin?
    self.role == "admin"
  end

  class << self
  def current_user=(user)
    Thread.current[:current_user] = user
  end

  def current_user
    Thread.current[:current_user]
  end
  end
  end
