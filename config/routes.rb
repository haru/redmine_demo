# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


RedmineApp::Application.routes.draw do
  match 'projects/:id/demo/:action', :controller => 'demo', :via => [:get, :post]
end