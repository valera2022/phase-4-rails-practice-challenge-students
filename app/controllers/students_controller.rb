class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def create 
        student = Student.create!(strong_params)
        render json: student
        
    
    end
    def index 
        student = Student.all
        render json: student
    
    end
    def update
        student = Student.find_by(id: params[:id])
        student.update(strong_params)
        render json: student
    
    end
    def delete
        student = Student.find_by(id: params[:id])
        student.destroy() 
    
    end
    private 

    def strong_params 
      params.permit(:name,:major,:age)
    end

    def record_not_found
        render json: { error: "Instructor not found" }, status: :not_found
    end
end

# - Create, read, update and delete **Students**
#   - When creating or updating a student, they must be associated with an
#     instructor