module API
    module V1
      class AccessCredentials < Grape::API
        include API::V1::Defaults
        resource :access_credentials do
          desc "Return all api keys"
          get "" do
            AccessCredential.all
          end

          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            AccessCredential.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end