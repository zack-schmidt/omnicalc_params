require "rails_helper"

feature "Flexible square" do
  it "works with input 5", points: 1 do
    visit "/flexible/square/5"

    expect(page).to have_content("25")
  end

  it "works with any input", points: 5 do
    random_input = rand(100)

    visit "/flexible/square/#{random_input}"

    expected_output = random_input ** 2

    expect(page).to have_content(expected_output)
  end
end

feature "Flexible square root" do
  it "works with input 8", points: 1 do
    visit "/flexible/square_root/8"

    expect(page).to have_content("2.83")
  end

  it "works with any input", points: 5 do
    random_input = rand(100)

    visit "/flexible/square_root/#{random_input}"

    expected_output = (random_input ** 0.5).round(2)

    expect(page).to have_content(expected_output)
  end
end

feature "Flexible payment" do
  it "works", points: 5 do
    visit "/flexible/payment/324/5/14503"

    expect(page).to have_content("262.15")
  end

  it "formats large payments", points: 2, hint: I18n.t("hints.number_to_currency") do
    visit "/flexible/payment/410/30/250000"

    expect(page).to have_content("$1,208.00")
  end
end

feature "Square form" do
  it "has a form element", points: 1 do
    visit "/square/new"

    expect(page).to have_css("form")
  end

  it "has a label", points: 2 do
    visit "/square/new"

    expect(page).to have_css("label", text: "Enter a number")
  end

  it "has an input", points: 2 do
    visit "/square/new"

    expect(page).to have_css("input")
  end

  it "has a button with the correct copy", points: 1, hint: I18n.t("hints.button_text") do
    visit "/square/new"

    expect(page).to have_css("button", text: "Calculate square")
  end

  it "when submitted leads to some other URL", points: 4 do
    visit "/square/new"

    expect(page).to have_css("form[action]")
  end

  it "captures the user's input in the query string with a name", points: 4 do
    visit "/square/new"

    expect(page).to have_css("input[name]")
  end

  it "works with 5", points: 6, hint: I18n.t("hints.label_for_input") do
    visit "/square/new"

    fill_in "Enter a number", with: 5

    click_button "Calculate square"

    expect(page).to have_content("25.0")
  end

  it "works with 6", points: 6, hint: I18n.t("hints.label_for_input") do
    visit "/square/new"

    fill_in "Enter a number", with: 6

    click_button "Calculate square"

    expect(page).to have_content("36.0")
  end
end

feature "Square root form" do
  it "has a form element", points: 1 do
    visit "/square_root/new"

    expect(page).to have_css("form")
  end

  it "has a label", points: 2 do
    visit "/square_root/new"

    expect(page).to have_css("label", text: "Enter a number")
  end

  it "has an input", points: 2 do
    visit "/square_root/new"

    expect(page).to have_css("input")
  end

  it "has a button with the correct copy", points: 2, hint: I18n.t("hints.button_text") do
    visit "/square_root/new"

    expect(page).to have_css("button", text: "Calculate square root")
  end

  it "when submitted leads to some other URL", points: 4, hint: I18n.t("hints.button_type") do
    visit "/square_root/new"

    expect(page).to have_css("form[action]")
  end

  it "captures the user's input in the query string with a name", points: 4 do
    visit "/square_root/new"

    expect(page).to have_css("input[name]")
  end

  it "works with 5", points: 6, hint: I18n.t("hints.label_for_input") do
    visit "/square_root/new"

    fill_in "Enter a number", with: 5

    click_button "Calculate square root"

    expect(page).to have_content("2.236")
  end

  it "works with 6", points: 8, hint: I18n.t("hints.label_for_input") do
    visit "/square_root/new"

    fill_in "Enter a number", with: 8

    click_button "Calculate square root"

    expect(page).to have_content("2.828")
  end
end

feature "Payment form" do
  it "has a form element", points: 1 do
    visit "/payment/new"

    expect(page).to have_css("form")
  end

  it "has a label for APR", points: 1 do
    visit "/payment/new"

    expect(page).to have_css("label", text: "APR")
  end

  it "has a label for number of years", points: 1 do
    visit "/payment/new"

    expect(page).to have_css("label", text: "Number of years")
  end

  it "has a label for principal", points: 1 do
    visit "/payment/new"

    expect(page).to have_css("label", text: "Principal")
  end

  it "has three inputs", points: 1 do
    visit "/payment/new"

    expect(page).to have_css("input", count: 3)
  end

  it "has a button with the correct copy", points: 1, hint: I18n.t("hints.button_text") do
    visit "/payment/new"

    expect(page).to have_css("button", text: "Calculate monthly payment")
  end

  it "when submitted leads to some other URL", points: 4 do
    visit "/payment/new"

    expect(page).to have_css("form[action]")
  end

  it "captures the user's input in the query string with names", points: 4 do
    visit "/payment/new"

    expect(page).to have_css("input[name]", count: 3)
  end

  it "works", points: 12, hint: I18n.t("hints.label_for_input") do
    visit "/payment/new"

    fill_in "APR", with: 4.1
    fill_in "Number of years", with: 30
    fill_in "Principal", with: 250000

    click_button "Calculate monthly payment"

    expect(page).to have_content("$1,208.00")
  end
end

feature "Random form" do
  it "has a form element", points: 1 do
    visit "/random/new"

    expect(page).to have_css("form")
  end

  it "has a label for minimum", points: 1 do
    visit "/random/new"

    expect(page).to have_css("label", text: "Minimum")
  end

  it "has a label for maximum", points: 1 do
    visit "/random/new"

    expect(page).to have_css("label", text: "Maximum")
  end

  it "has two inputs", points: 1 do
    visit "/random/new"

    expect(page).to have_css("input", count: 2)
  end

  it "has a button with the correct copy", points: 1, hint: I18n.t("hints.button_text") do
    visit "/random/new"

    expect(page).to have_css("button", text: "Pick random number")
  end

  it "when submitted leads to some other URL", points: 4 do
    visit "/random/new"

    expect(page).to have_css("form[action]")
  end

  it "captures the user's input in the query string with names", points: 4 do
    visit "/random/new"

    expect(page).to have_css("input[name]", count: 2)
  end

  it "has a \"Recalculate\" link", points: 1 do
    visit "/random/new"

    click_button "Pick random number"

    expect(page).to have_css("a", text: "Recalculate")
  end

  it "has a \"Recalculate\" link that works", points: 0 do
    visit "/random/new"

    fill_in "Minimum", with: -2.5

    fill_in "Maximum", with: 3.5

    click_button "Pick random number"

    original_results_url = page.current_url

    click_link "Recalculate"

    expect(page).to have_current_path(original_results_url, url: true)
  end
end
