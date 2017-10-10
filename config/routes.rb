Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/sums" => "application#calc"
  post "/filters" => "application#second"
  post "/intervals" => "application#thirty"
  post "/lin_regressions" => "application#lin"
end
