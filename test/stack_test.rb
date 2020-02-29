require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/stack'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Test Stack Implementation" do
  it "creates a Stack" do
    s = Stack.new
    expect(s.class).must_equal Stack
  end

  it "pushes something onto a empty Stack" do
    # skip
    s = Stack.new
    s.push(10)
    expect(s.to_s).must_equal "[10]"
  end

  it "pushes multiple somethings onto a Stack" do
    # skip
    s = Stack.new
    s.push(10)
    s.push(20)
    s.push(30)
    expect(s.to_s).must_equal "[10, 20, 30]"
  end

  it "starts the stack empty" do
    skip
    s = Stack.new
    expect(s.empty?).must_equal true
  end

  it "removes something from the stack" do
    skip
    s = Stack.new
    s.push(5)
    removed = s.pop
    expect(removed).must_equal 5
    expect(s.empty?).must_equal true
  end

  it "removes the right something (LIFO)" do
    skip
    s = Stack.new
    s.push(5)
    s.push(3)
    s.push(7)
    removed = s.pop
    expect(removed).must_equal 7
    expect(s.to_s).must_equal "[5, 3]"
  end
end