# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  authentication_token   :string(255)
#  gender                 :string(255)
#  fname                  :string(255)
#  lname                  :string(255)
#  uid                    :string(255)
#  birthday               :datetime
#  blood_pressure         :string(255)
#  growth                 :string(255)
#  weight                 :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_token_authenticatable

  validates_presence_of :fname, :on => :create
  validates_presence_of :lname, :on => :create
  validates_presence_of :birthday, :on => :create
  validates_presence_of :gender, :on => :create

  validates_length_of :fname, maximum: 60 #one utf-8 symbol = 1-4 char/bit max 255
  validates_length_of :lname, maximum: 60

  before_create :do_before_create

  has_one :address

  has_many :medical_histories

  has_and_belongs_to_many :user_roles, :uniq => true

  accepts_nested_attributes_for :address

  def to_param
    uid
  end

  def do_before_create
    make_uid
  end

  def make_uid
    self.uid = ["#{self.fname} #{self.lname}".parameterize, rand(36**6).to_s(36)].join("-")
  end
end
