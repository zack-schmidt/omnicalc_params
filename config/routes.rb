Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/flexible/square/:num", { :controller => "calculations", :action => "flexible_square"})
  get("/flexible/square_root/:num", { :controller => "calculations", :action => "flexible_square_root"})
  get("/flexible/payment/:basis_points/:number_of_years/:present_value", { :controller => "calculations", :action => "flexible_payment"})
  get("flexible/random/:min/:max", { :controller => "calculations", :action => "flexible_random"})
  get("/square/new", { :controller => "calculations", :action => "square_form"})
  get("/square/results", { :controller => "calculations", :action => "square_results"})
  get("/square_root/new", { :controller => "calculations", :action => "square_root_form"})
  get("/square_root/results", { :controller => "calculations", :action => "square_root_results"})
  get("/payment/new", { :controller => "calculations", :action => "payment_form"})
  get("/payment/results", { :controller => "calculations", :action => "payment_results"})
  get("/random/new", { :controller => "calculations", :action => "random_form"})
  get("/random/results", { :controller => "calculations", :action => "random_results"})

end
