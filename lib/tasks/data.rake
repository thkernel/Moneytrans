namespace :data do
  desc "Load default data"
  task default_data: :environment do

  	# Roles

	unless Role.all.present?
	    roles = Role.create(
	        [
	            {name: "Superuser"},
	            {name: "Administrateur"},
	            {name: "Client"},
	            

	            

	        ])
	else
	    roles = Role.all

	end


	# Accounts
	unless Account.all.present?
	    accounts = Account.create([
	        {login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id:  Role.find_by(name: "superuser").id},
	        

	    
	    ])
	else   
	    accounts = Account.all
	end

	# Profile
	#unless Profile.all.present?
	#    profile = Profile.create([
	#        {
	#            first_name: "Super",  
	#            last_name: "User",
	#            #service_id: services.first.id,   
	#            user_id: User.find_by(login: "superuser").id
	#        }
	#    
	#    ])

	#end



=begin
	unless Feature.all.present?
	    features = Feature.create([
	        {
	            name: "Courrier d'arrivée",
	            subject_class: "ArrivalMail"
	            
	        },
	        {
	            name: "Courrier départ" ,
	            subject_class: "DepartureMail"
	            
	        },
	        {
	            name: "Imputation",
	            subject_class: "Imputation"
	            
	        },
	        {
	            name: "Rôle",
	            subject_class: "Role"
	            
	        },
	        {
	            name: "Division",
	            subject_class: "Division" 
	            
	        },
	        {
	            name: "Logs",
	            subject_class: "ActivityLog"
	            
	        },
	        {
	            name: "Correspondant",
	            subject_class: "Correspondent"
	            
	        },
	        {
	            name: "Type de correspondant",
	            subject_class: "CorrespondentType" 
	            
	        },
	        {
	            name: "Service",
	            subject_class: "Service"
	            
	        },
	        {
	            name: "Configuration SMTP",
	            subject_class: "SmtpConfig" 
	            
	        },

	        {
	            name: "Registre",
	            subject_class: "Register"
	            
	        },
	        {
	            name: "Nature",
	            subject_class: "Nature" 
	            
	        },
	        {
	            name: "Support",
	            subject_class: "Support" 
	            
	        },
	        {
	            name: "Dossier",
	            subject_class: "Folder" 
	            
	        },
	        {
	            name: "Direction",
	            subject_class: "Direction" 
	            
	        },
	        {
	            name: "Demande",
	            subject_class: "Request" 
	            
	        },
	        {
	            name: "Type de demande",
	            subject_class: "RequestType"
	            
	        },
	        {
	            name: "Ticket",
	            subject_class: "Ticket" 
	            
	        },
	        {
	            name: "Document",
	            subject_class: "Document" 
	            
	        },
	        {
	            name: "Commantaire",
	            subject_class: "Comment" 
	            
	        },
	        {
	            name: "Organisation",
	            subject_class: "Organization" 
	            
	        },
	        {
	            name: "Type d'organisation",
	            subject_class: "OrganizationType" 
	            
	        },
	        {
	            name: "Type de tâche",
	            subject_class: "TaskType"   
	        },
	        {
	            name: "Status des tâches",
	            subject_class: "TastStatus" 
	            
	        },
	        {
	            name: "Permission",
	            subject_class: "Permission" 
	            
	        },
	        {
	            name: "Utilisateur",
	            subject_class: "User" 
	            
	        },
	        {
	            name: "Paramètre"
	        },
	        {
	            name: "Configuration" 
	        }
	    
	    ])

	end


	


  end

=end



# Currencies
unless Currency.all.present?
    currencies = Currency.create(
        [
            {name: "Euro", iso_code: "EUR", symbol_position: "Gauche", account_id: accounts.first.id},
            {name: "Dollar US", iso_code: "USD", symbol_position: "Gauche", account_id: accounts.first.id},
            {name: "Franc CFA", iso_code: "XOF", symbol_position: "Droite", account_id: accounts.first.id},
            
            
        ])
else    
    currencies =  Currency.all

end

#Identity document type
unless IdentityDocumentType.all.present?
    identity_document_types = IdentityDocumentType.create([
        {
            name: "Carte d'identité nationale", 
            account_id: accounts.first.id,   
        },
        {
            name: "NINA", 
            account_id: accounts.first.id,   
        },
        {
            name: "Passeport", 
            account_id: accounts.first.id,   
        },
        {
            name: "Permis de conduire", 
            account_id: accounts.first.id,   
        },
        

    ])
else  
    identity_document_types = IdentityDocumentType.all

end


#Transfer reasons
unless TransferReason.all.present?
    transfer_reasons = TransferReason.create([
        {
            name: "Achat de bien et service", 
            account_id: accounts.first.id,   
        },
        {
            name: "Epargne", 
            account_id: accounts.first.id,   
        },
        {
            name: "Assistance familiale", 
            account_id: accounts.first.id,   
        },
        {
            name: "Frais médicaux", 
            account_id: accounts.first.id,   
        },
        {
            name: "Frais scolaire", 
            account_id: accounts.first.id,   
        },
        {
            name: "Investissement", 
            account_id: accounts.first.id,   
        },
        {
            name: "oeuvre et don", 
            account_id: accounts.first.id,   
        }
        

    ])
else  
    transfer_reasons = TransferReason.all

end


#Countries
unless Country.all.present?
  countries = Country.create([
    {
            name: "Mali", 
            account_id: accounts.first.id,   
        },
        {
            name: "Turquie", 
            account_id: accounts.first.id,   
        },
        {
            name: "France", 
            account_id: accounts.first.id,   
        },
        {
            name: "Sénégal", 
            account_id: accounts.first.id,   
        },
        {
            name: "Nigeria", 
            account_id: accounts.first.id,   
        },
        {
            name: "Togo", 
            account_id: accounts.first.id,   
        },
        {
            name: "Ghana", 
            account_id: accounts.first.id,   
        }
        

    ])
	else  
    countries = Country.all

	end

end

end
