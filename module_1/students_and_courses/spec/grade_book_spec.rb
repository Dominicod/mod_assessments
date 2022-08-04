require 'spec_helper'
require_relative '../lib/grade_book'
require_relative '../lib/course'
require_relative '../lib/student'

RSpec.describe GradeBook do
  let(:grade_book) {grade_book = GradeBook.new("Meg")}
  let(:course_1) {course = Course.new("Calculus", 2)}
  let(:course_2) {course = Course.new("Geo", 3)}
  let(:course_3) {course = Course.new("Programming", 1)}
  let(:student_1) {student = Student.new({name: "Morgan", age: 21})}
  let(:student_2) {student = Student.new({name: "Jordan", age: 29})}
  let(:student_3) {student = Student.new({name: "Dominic", age: 23})}
  let(:student_4) {student = Student.new({name: "Abdul", age: 27})}

  describe '.GradeBook_initialize' do
    it 'instantiates object' do
      expect(grade_book).to be_an_instance_of described_class
    end
    it 'returns instance variables' do
      expect(grade_book.instructor).to eq "Meg" 
      expect(grade_book.courses).to eq []
    end
  end

  describe '#add_course' do
    it 'adds courses' do
      grade_book.add_course(course_1)

      expect(grade_book.courses).to eq [course_1]

      grade_book.add_course(course_2)
      grade_book.add_course(course_3)

      expect(grade_book.courses).to eq [course_1, course_2, course_3]
    end
  end

  describe '#list_students' do
    it 'lists students in courses' do
      course_1.enroll(student_1)
      course_2.enroll(student_2)
      course_2.enroll(student_3)
      course_3.enroll(student_4)
      
      grade_book.add_course(course_1)
      grade_book.add_course(course_2)
      grade_book.add_course(course_3)

      hash_outcome = {
        "Calculus" => [student_1],
        "Geo" => [student_2, student_3],
        "Programming" => [student_4]
      }

      expect(grade_book.students).to eq hash_outcome    
    end
  end

  describe '#students_by_grade' do
    it 'displays students by a given grade' do
      course_1.enroll(student_1)
      course_2.enroll(student_2)
      course_2.enroll(student_3)
      course_3.enroll(student_4)
      
      grade_book.add_course(course_1)
      grade_book.add_course(course_2)
      grade_book.add_course(course_3)

      student_1.log_score(89)
      student_1.log_score(78)
      student_2.log_score(70)
      student_2.log_score(50)
      student_3.log_score(70)
      student_4.log_score(84)

      expect(grade_book.students_by_grade(70)).to eq [student_2]
      expect(grade_book.students_by_grade(80)).to eq [student_2, student_3]
    end
  end
end