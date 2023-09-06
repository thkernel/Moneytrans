module API
    module V1
      class Orders < Grape::API
        include API::V1::Defaults
        resource :orders do
          desc "Return all orders"
          
          get "" do
            orders = Order.all

            if orders.present?
                orders 
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