# frozen_string_literal: true

require 'rails_helper'

RSpec.describe do
  it 'x is a string' do
    x = 'this is a test'
    expect(x).to be_a(String)
  end
end
