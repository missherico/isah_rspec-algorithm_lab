require 'rspec'
require './sorted_array.rb'

shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should eq source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el } }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map

        it 'creates a new array containing the values returned by the block' do

          sorted_array.map {|el| el + 2}.should eq [4, 5, 6, 9, 11]
          # pending "fill this spec in with a meaningful example"
        end
      end
    end

    describe "that update the original array" do
      describe :map! do
        it 'the original array should be updated' do
          sorted_array.map! { |el| el}.should == [2,3,4,7,9]
          # pending "fill this spec in with a meaningful example"
        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
          
        sorted_array.map! { |n| 2 * n}.should_not == [2, 3, 4, 7, 9]

          #pending "this is just the same as the example above"
        end
      end
    end
  end

  describe :find do
    #this line is wrong:
    #it_should_behave_like "yield to all elements in sorted array", :find
    
    it "iterates through elements and if not there, return nil" do

      sorted_array.find{|el| el == 17}.should == nil

    end

    it "detects and returns the first element that matches the value" do
      
      sorted_array.find{ |el| el % 3 == 0 }.should eq 3
      #pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-find"
    end
  end

  describe :inject do
    #this line is wrong:
    #it_should_behave_like "yield to all elements in sorted array", :inject

    it "does not currently have any examples for it" do
      pending "define some examples by looking up http://www.ruby-doc.org/core-2.1.0/Enumerable.html#method-i-inject"
    end
  end
end
