class CalculationsController < ApplicationController



  def flex_square
    @the_number = params["num"].to_f
    render("calculations/flex_square.html.erb")
  end

  def flex_square_root
    @the_number = params["num"].to_f
    render("calculations/flex_square_root.html.erb")
  end

  def flex_payment
    @the_basis_points = params["basis_points"].to_f
    @the_number_of_years = params["number_of_years"].to_f
    @the_present_value = params["present_value"].to_f
    @the_monthly_payment = (@the_present_value*@the_basis_points/1200)/((1-((1+(@the_basis_points/1200))**(-@the_number_of_years*12))))
    render("calculations/flex_payment.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square_results
    render("calculations/square_results.html.erb")
  end

end
