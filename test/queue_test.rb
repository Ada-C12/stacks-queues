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
    expect(q.to_s).must_equal("[nil, nil, 30, nil, nil, nil, nil, nil, nil, nil]")
    q.enqueue(40)
    expect(q.to_s).must_equal("[nil, nil, 30, 40, nil, nil, nil, nil, nil, nil]")
    q.enqueue(50)
    q.enqueue(60)
    q.enqueue(70)
    q.enqueue(80)
    q.enqueue(90)
    q.enqueue(100)
    expect(q.to_s).must_equal("[nil, nil, 30, 40, 50, 60, 70, 80, 90, 100]")
    q.enqueue(110)
    # circular buffer in action: front index points to 30, back index points to 110
    expect(q.to_s).must_equal("[110, nil, 30, 40, 50, 60, 70, 80, 90, 100]")
    q.enqueue(120)
    # resize in action: queue length has hit 10, so another 10 spots are added at back of the array and queue is resorted with @front at index 0
    expect(q.to_s).must_equal("[30, 40, 50, 60, 70, 80, 90, 100, 110, 120, nil, nil, nil, nil, nil, nil, nil, nil, nil]")
    q.enqueue(130)
    # after resizing, next element is added at the back
    expect(q.to_s).must_equal("[30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, nil, nil, nil, nil, nil, nil, nil, nil]")
    q.enqueue(140)
    expect(q.to_s).must_equal("[30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, nil, nil, nil, nil, nil, nil, nil]")
    q.enqueue(150)
    q.enqueue(160)
    q.enqueue(170)
    q.enqueue(180)
    q.enqueue(190)
    q.enqueue(200)
    q.enqueue(210)
    expect(q.dequeue).must_equal 30
    expect(q.to_s).must_equal("[nil, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210]")
  end

  it "works for a large queue with a large number of adds and removes" do
    q = Queue.new

    99.times do 
      q.enqueue(10)
    end

    10.times do 
      expect(q.dequeue).must_equal 10
    end

    5.times do 
      q.enqueue(5)
    end

    expected_answer = "["
    89.times do 
      expected_answer = expected_answer + "10, "
    end

    4.times do 
      expected_answer = expected_answer + "5, "
    end
    expected_answer = expected_answer + "5]"

    expect(q.to_s).must_equal expected_answer
  end
end
