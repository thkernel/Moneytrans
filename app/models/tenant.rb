
require 'rake'
Moneytrans::Application.load_tasks

class Tenant < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  
   after_create :create_tenant 
    
    belongs_to :account, optional: true
    belongs_to :country, optional: true
   


    #validates :organization_type, presence: true
    #validates :organization_name, presence: true, uniqueness: true
    validates :subdomain, format: { with: /\A[\w\-]+\Z/i, message: "Le sous-domaine contient des caractères invalide"},
    exclusion: { in: ['www'], message: 'restricted'}

    

    # Change default params ID to uid
  def to_param
    uid
  end
  
    
    def tenant_name
      self.subdomain.downcase
    end



    # Create tenant db
  def create_tenant 
    Apartment::Tenant.create(self.tenant_name) # Create tenant db
    default_data(self.tenant_name) # Load default data
    create_administrator(self.tenant_name) # Create default admin
        
    
  end

  def default_data(tenant)
      Apartment::Tenant.switch(tenant) do
          #rake "data:default_data"
          Rake::Task['data:default_data'].execute
      end
  end


  #Create the subdomain on the server
  def create_subdomain
  end

  # Create administrator account onto db
  def create_administrator(tenant)

    #Generate password string
      random_password = SecureRandom.alphanumeric(10)
        
    #Switch to the current tenant
    Apartment::Tenant.switch(tenant) do
      

      admin_account = Account.create({
        login: "Administrateur",
        email: self.email,
        password: "admin@2023",
        password_confirmation: "admin@2023",
        role_id: Role.find_by(name: "Administrateur").id
      })


      if admin_account.present?
      #  profile = Profile.new
      #  profile.user_id = admin_user.id
      #  profile.save

      #    if profile.present?
             create_company(tenant, admin_account.id)
      #        TenantEmailJob.perform_now(self, "demo@2021")
      #    end
      end


    end
  end


  def create_company(tenant, account_id)
    #Switch to the current tenant
    Apartment::Tenant.switch(tenant) do    
      company = Company.create({
          social_reason: self.social_reason,
          name: self.name,
          #country_id: self.country,
          city: self.city,
          phone: self.phone,
          #website: self.website,
          address: self.address,
          account_id: account_id
          
      })

            
    end
  end

end
