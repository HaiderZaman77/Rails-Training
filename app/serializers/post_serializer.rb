class PostSerializer < ActiveModel::Serializer

    attributes :id, :name, :title, :content, 
         :created_at, :updated_at
  end