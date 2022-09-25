Rails.application.routes.draw do
  # This maps the 'root' (index page) to 'index' action of 'articles' controller
  root "articles#index"

  resources :articles
  # The thing above is a short-cut for this stuff (and more):

  # this maps the 'articles' route to the 'index' action (method) of the 'articles' controller
  # named ArticlesController by convention and pladed in app/controllers
  # get "/articles", to: "articles#index"

  # this maps the 'articles/:id' route to the 'show' action (method) of the 'articles' controller
  # named ArticlesController by convention and pladed in app/controllers. The supplied ':id' is
  # available in the 'show' method as params[:id]
  # get "/articles/:id", to: "articles#show"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
