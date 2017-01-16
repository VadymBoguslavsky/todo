require 'rails_helper'


RSpec.describe Task do
it 'is not valid without a title' do
  task = Task.new
  expect (task).valid?
end

  it 'is not valid with a title longer than 100 symbols' do
    task = Task.new(title:'a' * 101)
    expect (task).valid?
  end


end