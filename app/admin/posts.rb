ActiveAdmin.register Post do

  # N+1解決
  controller do
    def scoped_collection
      Post.includes([:user])
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :content, :user_id, :image, :herb_id, :topic_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :user_id, :image, :herb_id, :topic_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
