require 'spec_helper'
require_relative '../lib/student'

RSpec.describe Student do
  let(:student) {student = Student.new({name: "Morgan", age: 21})}

  describe '.student_initialize' do
    it 'instantiates object' do
      expect(student).to be_an_instance_of described_class
    end
    it 'returns instance variables' do
      expect(student.name).to eq "Morgan"
      expect(student.age).to eq 21
      expect(student.scores).to eq []
    end
  end

  describe '#log_score' do
    it 'keeps log of score' do
      student.log_score(89)
      student.log_score(78)

      expect(student.scores).to eq [89,78]
    end
  end

  describe '#grade' do
    it 'averages scores' do
      student.log_score(89)
      student.log_score(78)

      expect(student.grade).to eq 83.5
    end
  end
end