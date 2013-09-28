class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:phonenumber]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :phonenumber,:password, :password_confirmation, :remember_me

  validates :phonenumber,
    :uniqueness => {
      message:'该号码已存在！',
      case_sensitive: false
  },
    :length =>{ in:11..11,message:'号码长度应为11'},
    :format =>{with: /[0-9]{11}/, message:'号码格式错误'}

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if phonenumber = conditions.delete(:phonenumber)
      where(conditions).where(["lower(phonenumber) = :value", { :value => phonenumber.downcase }]).first
    else
      where(conditions).first
    end
  end

end
