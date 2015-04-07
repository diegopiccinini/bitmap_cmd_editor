Given(/^a bitmap was created typing the command "([^"]*)"$/) do |command|
  steps %{
    Given a bitmap created
		And The user type "#{command}"
  }
end

When(/^The user tries to colour "([^"]*)"$/) do |command|
  @command = @bitmap.process_command(command)
end
