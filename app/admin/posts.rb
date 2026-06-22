ActiveAdmin.register Post do
  permit_params :title, :body, :published, :published_at

  index do
    selectable_column
    id_column
    column :title
    column :published
    column :published_at
    column :created_at
    actions
  end

  filter :title
  filter :published
  filter :published_at
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :published
      f.input :published_at, as: :datetime_picker
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :published
      row :published_at
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
