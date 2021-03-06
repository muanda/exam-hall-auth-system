Given("{string} has the following recipe exist:") do |email, recipe_table|
  user = User.find_by_email(email)
  recipe_table.hashes.each do |recipe|
    user.recipes.create!(recipe)
  end
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  find('#search_name[value= "name"]').click if field == "name"
  find('#search_origin[value= "origin"]').set(true) if field == "origin"
  find('#search_create_by[value= "create_by"]').click if field == "creater"
end


Given("the following ingredients exist:") do |ingredient_table|
  ingredient_table.hashes.each do |ingredient|
    recipe = Recipe.find(ingredient[:id])
    recipe.ingredient.create!(ingredient)
  end
end


Then("I should see list of registred sudent:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
   #student = Student.all
end


Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then("It should navigate to {string}") do |page_name|
 visit path_to(page_name)
end


When("I fill in {string} with {string}") do |string, string2|
  fill_in string,	with: string2
end

Given("I  click {string}") do |link|
    click_link  link
end

When /^I press on (.*)$/ do |button|
  #  find('input[value= "Create Student"]').click if button = "Create Student"
   find('input[value= "Create Student"]').click if button = "Create Student"

  # if button = 'comment'
  # find('input[id= "comment"]').click
  # end

  # if button == 'Create Student'
  #   find('input[value= "Create Student"]').click
  # end


end




Then("the number of {string} on the database should be {int}") do |string, int|
 expect(User.count).to eq int if string == "user"
  expect(Recipe.count).to eq int if string == 'recip'
   expect(Recipe.count).to eq int if string == 'recipe-del'
end
Then("I should see {string}") do |string|
  page.should have_content(string)
end

Then("show me the page") do
  save_and_open_page
end

Then("It should redirect me to {string}") do |comment_page|
   visit path_to(comment_page)
end

Given("the following Student exists:") do |table|
  table.hashes.each do |studnet|
    Student.create!(studnet)

  end
end

When("I visit the {string} show page") do |text|
    student = Student.find_by_id_number(text)
    visit   student_path(student)
end

Given("I visit the {string} recipe {string} show page") do |string, string2|
    user = User.find_by_email(string)
    recipe = user.recipes.find_by(name: string2)
    visit user_recipe_path(user,recipe)
end

When("I click on {string}") do |text|
  click_link_or_button text
end

Given("{string} has the following ingredient exist:") do |recipe_name, ingredient_table|
  recipe = Recipe.find_by(name:recipe_name)
  ingredient_table.hashes.each do |ingredient|
    recipe.ingredient.create!(ingredient)
  end
end

Given("{string} has the following step exist:") do |recipe_name, step_table|
  recipe = Recipe.find_by(name:recipe_name)
  step_table.hashes.each do |step|
    recipe.steps.create!(step)
  end
end

Then("I should not see {string}") do |string|
  page.should have_no_content(string)
end