Then(/^the bitmap should be$/) do |table|
	expected_table=table.raw
  expect(@bitmap.table).to match_array(expected_table)
end
