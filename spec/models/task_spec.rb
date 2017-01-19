require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @task = Task.new(title: "my new title")
  end
  it 'we got what we need?' do
    expect(@task.title).to eq("my new title")
  end


  it 'is not valid with a title longer than 100 symbols' do
    task = Task.new(title: 'a' * 101)
    expect(task).to be_valid
  end
end