class StudentsController < ApplicationController

  def index
    students = Student.all
  
    if params[:name].present?
      name = params[:name].downcase
      students = students.select { |student| student.first_name.downcase.include?(name) || student.last_name.downcase.include?(name) }
    end
    
    render json: students
  end
  

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
