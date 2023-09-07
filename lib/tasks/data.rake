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
                {name: "Gérant"},
                {name: "Agent"},
	            

	            

	        ])
	else
	    roles = Role.all

	end


	# Users
    unless User.all.present?
        users = User.create([
            {
                first_name: "Amos", 
                last_name: "DEMBELE",
            },
            {
                first_name: "Admin", 
                last_name: "Admin",
            },
            
        ])
    else
        users = User.all
    end


    # Accounts
    unless Account.all.present?
        accounts = Account.create([
            {accountable: users[0], login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "Superuser").id},
            {accountable: users[2], login: "admin",  email: "admin@gmail.com",  password: "Root@2023", password_confirmation: "Root@2023", role_id: Role.find_by(name: "Superuser").id}
            
        ])

    else
        accounts = Account.all
    end






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
