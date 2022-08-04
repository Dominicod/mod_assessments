class GradeBook
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = Array.new
  end

  def add_course(course)
    @courses << course
  end

  def students
    student_hash = Hash.new
    @courses.map {|course| student_hash.store(course.name, course.students)}
    student_hash
  end

  def students_by_grade(grade)
    students = students().map do |course|
      course[1].find_all {|student| student.grade < grade}
    end.flatten
  end
end