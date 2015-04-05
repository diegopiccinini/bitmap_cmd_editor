Given(/^a bitmap created$/) do
  @bitmap = Bitmap.new
end

When(/^The user type "([^"]*)"$/) do |command|
  @bitmap.process_command(command)
end

Then(/^this bitmap should be created$/) do |table|
	expected_table=table.raw
  expect(@bitmap.table).to match_array(expected_table)
end
When(/^The user attempts to create "([^"]*)"$/) do |command|
  @command = @bitmap.process_command(command)
end

Then(/^He should see the message "([^"]*)"$/) do |message|
  expect(@command).to include(message)
end
