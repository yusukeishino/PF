ActiveAdmin.register User do
  permit_params :name, :body
end
