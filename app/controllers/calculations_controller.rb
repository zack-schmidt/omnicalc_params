class CalculationsController < ApplicationController



  def flexible_square
    @the_number = params["num"].to_f
    @the_number_squared = @the_number ** 2
    render("calculations/flexible_square.html.erb")
  end

  def flexible_square_root
    @the_number = params["num"].to_f
    @the_number_route = @the_number ** 0.5
    render("calculations/flexible_square_root.html.erb")
  end

  def flexible_payment
    @the_basis_points = params["basis_points"].to_f
    @the_number_of_years = params["number_of_years"].to_f
    @the_present_value = params["present_value"].to_f
    @the_monthly_payment = (@the_present_value*@the_basis_points/120000)/((1-((1+(@the_basis_points/120000))**(-@the_number_of_years*12))))
    render("calculations/flexible_payment.html.erb")
  end

  def flexible_random
    @the_minimum = params["min"].to_f
    @the_maximum = params["max"].to_f
    @the_random_number = rand(@the_minimum...@the_maximum)
    render("calculations/flexible_random.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square_results
    @the_number = params["user_number"].to_f
    @the_number_squared = @the_number ** 2
    render("calculations/square_results.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root_results
    @the_number = params["user_number"].to_f
    @the_number_squared = @the_number ** 0.5
    render("calculations/square_root_results.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment_results
    @the_basis_points = params["user_apr"].to_f
    @the_number_of_years = params["user_number_of_years"].to_f
    @the_present_value = params["user_principal"].to_f
    @the_monthly_payment = (@the_present_value*@the_basis_points/1200)/((1-((1+(@the_basis_points/1200))**(-@the_number_of_years*12))))
    render("calculations/payment_results.html.erb")
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def random_results
    @the_minimum = params["user_min"].to_f
    @the_maximum = params["user_max"].to_f
    @the_random_number = rand(@the_minimum...@the_maximum)
    render("calculations/random_results.html.erb")
  end

end
