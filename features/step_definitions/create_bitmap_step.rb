Then(/^this bitmap should be created$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  @bitmap_image = table.raw
end
