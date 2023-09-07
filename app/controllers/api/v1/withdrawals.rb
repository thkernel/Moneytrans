module API
    module V1
      class Withdrawals < Grape::API
        include API::V1::Defaults
        resource :withdrawals do
          desc "Return all transfers"
          
          get "" do
            withdrawals = Withdrawal.all

            if withdrawals.present?
                withdrawals
            else
              {status: "empty", message: "Empty"} 
            end
            
          end


          desc "Return by status"
          get "/completed" do 
            
              polls = Poll.where(status: "Terminé") 
              if polls.present?
                polls 
              else
                {status: "empty", message: "Empty"} 
              end

              

          end

          desc "Return by status"
          get "/active/status" do 
            
              polls = Poll.where(status: "En cours") 
              if polls.present?
                polls

              else
                {status: "empty", message: "Empty"}                  
                
              end

              

          end



        desc "Return a Polls"
          params do
            requires :id, type: Integer, desc: "ID of the user"
          end
          get ":id" do
            Poll.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end