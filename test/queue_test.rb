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
    expect(q.to_s).must_equal "[10]"
  end
  
  it "adds multiple somethings to a Queue" do
    q = Queue.new
    q.enqueue(10)
    q.enqueue(20)
    q.enqueue(30)
    expect(q.to_s).must_equal "[10, 20, 30]"
  end
  
  it "starts the size of a Queue at 0" do
    q = Queue.new
    q.empty?.must_equal true
  end
  
  it "a Queue is empty after removing all the elements" do
    q = Queue.new
    q.enqueue(5)
    q.enqueue(6)
    expect(q.dequeue).must_equal 5
    expect(q.dequeue).must_equal 6
    expect(q.empty?).must_equal true
  end
  
  it "removes something from the Queue" do
    q = Queue.new
    q.enqueue(5)
    removed = q.dequeue
    removed.must_equal 5
    q.empty?.must_equal true
  end
  
  it "removes the right something (LIFO)" do
    q = Queue.new
    q.enqueue(5)
    q.enqueue(3)
    q.enqueue(7)
    removed = q.dequeue
    removed.must_equal 5
    q.to_s.must_equal "[3, 7]"
  end
  
  it "properly adjusts the size with enqueueing and dequeueing" do
    q = Queue.new
    q.empty?.must_equal true
    q.enqueue(-1)
    q.enqueue(-60)
    q.empty?.must_equal false
    q.dequeue
    q.dequeue
    q.empty?.must_equal true
  end
  
  it "returns the front element in the Queue" do
    q = Queue.new
    q.enqueue(40)
    q.enqueue(22)
    q.enqueue(3)
    q.dequeue
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
    # q.enqueue(150)
    q.enqueue(150)
    q.enqueue(160)
    q.enqueue(170)
    q.enqueue(180)
    q.enqueue(190)
    q.enqueue(200)
    q.enqueue(210)
    q.dequeue
    
    expect(q.to_s).must_equal('[40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210]')
  end

  it "can print out queue in the right order when queue wraps around the circular buffer" do
    q = Queue.new
    100.times do |number|
      q.enqueue(number)
    end
    
    95.times do 
      q.dequeue
    end

    q.enqueue(1)
    expect(q.to_s).must_equal('[95, 96, 97, 98, 99, 1]')
  end

  it "can expand queue when queue reaches max default capacity" do
    q = Queue.new
    100.times do |number|
      q.enqueue(number)
    end

    q.enqueue(1000)

    expect(q.to_s).must_equal('[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 1000]')
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
