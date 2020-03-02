require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/queue'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Test Queue Implementation" do
  it "creates a Queue" do
    q = Queue.new
    expect(q.class).must_equal Queue
  end

  it "adds something to an empty Queue" do
    q = Queue.new
    q.enqueue(10)
    expect(q.to_s).must_equal "[10, nil, nil, nil, nil, nil, nil, nil, nil, nil]"
  end

  it "adds multiple somethings to a Queue" do
    q = Queue.new
    q.enqueue(10)
    q.enqueue(20)
    q.enqueue(30)
    expect(q.to_s).must_equal "[10, 20, 30, nil, nil, nil, nil, nil, nil, nil]"
  end

  it "starts the size of a Queue at 0" do
    q = Queue.new
    _(q.empty?).must_equal true
  end

  it "a Queue is empty after removing all the elements" do
    q = Queue.new
    q.enqueue(5)
    q.enqueue(6)
    # changed text syntax so I could better understand why code wasn't passing
    expect( (q.dequeue) ).must_equal 5
    expect( (q.dequeue) ).must_equal 6
    expect(q.empty?).must_equal true
  end

  it "removes something from the Queue" do
    q = Queue.new
    q.enqueue(5)
    removed = q.dequeue
    _(removed).must_equal 5
    _(q.empty?).must_equal true
  end

  it "removes the right something (LIFO)" do
    q = Queue.new
    q.enqueue(5)
    q.enqueue(3)
    q.enqueue(7)
    expect(q.to_s).must_equal "[5, 3, 7, nil, nil, nil, nil, nil, nil, nil]"
    removed = q.dequeue
    _(removed).must_equal 5
    _(q.to_s).must_equal "[nil, 3, 7, nil, nil, nil, nil, nil, nil, nil]"
  end

  it "properly adjusts the size with enqueueing and dequeueing" do
    q = Queue.new
    _(q.empty?).must_equal true
    q.enqueue(-1)
    q.enqueue(-60)
    _(q.empty?).must_equal false
    q.dequeue
    q.dequeue
    _(q.empty?).must_equal true
  end

  it "returns the front element in the Queue" do
    q = Queue.new
    q.enqueue(40)
    q.enqueue(22)
    q.enqueue(3)
    # 
    expect(q.to_s).must_equal "[40, 22, 3, nil, nil, nil, nil, nil, nil, nil]"
    expect(q.dequeue).must_equal 40
    expect(q.dequeue).must_equal 22
  end
  it "works for a large Queue" do
    q = Queue.new
    q.enqueue(10)
    q.enqueue(20)
    q.enqueue(30)
    expect(q.dequeue).must_equal 10
    expect(q.dequeue).must_equal 20
    q.enqueue(40)
    q.enqueue(50)
    q.enqueue(60)
    q.enqueue(70)
    q.enqueue(80)
    q.enqueue(90)
    q.enqueue(100)
    q.enqueue(110)
    q.enqueue(120)
    q.enqueue(130)
    q.enqueue(140)
    q.enqueue(150)
    q.enqueue(150)
    q.enqueue(160)
    q.enqueue(170)
    q.enqueue(180)
    q.enqueue(190)
    q.enqueue(200)
    q.enqueue(210)
    q.dequeue

    expect(q.to_s).must_equal("[100, 110, nil, 130, 140, 150, 150, 160, 170, 180, 190, 200, 210, nil, nil, nil, nil, nil, nil, nil]")
  end
end
