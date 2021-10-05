# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
  #fail "Unimplemented"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  records = page.find("table#movies.table.table-striped.col-md-12 tbody").all("tr")
  i = 0
  e1_ind = 0
  e2_ind = 0
  records.each do |record|
    title = record.first("td").text
    if title == e1
      e1_ind = i
    elsif title == e2
      e2_ind = i
    end
    i+=1
  end
  expect(e1_ind).to be<e2_ind
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').each do |rat|
    if uncheck
      uncheck("ratings_#{rat.strip()}")
    else
      check("ratings_#{rat.strip()}")
    end
  end
  #fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  total_row_count = page.find("table#movies.table.table-striped.col-md-12 tbody").all("tr").count
  expect(total_row_count).to eq Movie.all.size
  #fail "Unimplemented"
end
