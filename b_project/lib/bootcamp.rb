class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def name 
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(new_teacher)
    @teachers << new_teacher
  end

  def enroll(new_student)
    if @students.length < @student_capacity
      @students << new_student
      return true
    else 
      return false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      return true
    else
      return false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    total_num_grades = @grades[student].length
    if total_num_grades > 0
      average = @grades[student].sum / total_num_grades
      return average.floor
    else
      return nil
    end
  end

  def student_to_teacher_ratio
    ratio = @students.length / @teachers.length
    ratio.floor
  end

end
