module Api
    module V1
      class Posts < Grape::API
        include Api::V1::Defaults
  
        resource :posts do
          desc "Return all posts"
          get "", root: :posts do
            Post.all
          end
  
          desc "Return a graduate"
          params do
            requires :id, type: String, desc: "ID of the 
              post"
          end
          get ":id", root: "post" do
            Post.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end