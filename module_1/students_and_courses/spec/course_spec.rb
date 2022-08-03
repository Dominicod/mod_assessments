require 'spec_helper'
require_relative '../lib/course'
require_relative '../lib/student'

RSpec.describe Course do
  let(:course) {course = Course.new("Calculus", 2)}
  let(:student_1) {student = Student.new({name: "Morgan", age: 21})}
  let(:student_2) {student = Student.new({name: "Jordan", age: 29})}

  describe '.Course_initialize' do
    it 'instantiates object' do
      expect(course).to be_an_instance_of described_class
    end
    it 'returns instance variables' do
      expect(course.name).to eq "Calculus"
      expect(course.capacity).to eq 2
      expect(course.students).to eq []
    end
  end

  describe '#full?' do
    it 'returns boolean indicating class full?' do
      expect(course.full?).to eq false
    end
  end

  describe '#enroll' do
    it 'enrolls student to course' do
      course.enroll(student_1)
      course.enroll(student_2)

      expect(course.students).to eq [student_1, student_2]
      expect(course.full?).to eq true
    end
  end
end