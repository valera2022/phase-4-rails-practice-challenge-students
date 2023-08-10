class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index 
    instructor = Instructor.find_by(id: params[:id])
     render json: instructor
      
    end

    def create 
    instructor = Instructor.create!(strong_params) 
    render json: instructor    
    end

    def update 
    instructor = Instructor.find_by(id: params[:id])
    instructor.update(strong_params)
    render json: instructor
    
    end
    def destroy 
    instructor = Instructor.find_by(id: params[:id])
    instructor.destroy()
    
    end

    private 

    def strong_params 

    params.permit(:name)
    
    end
    def record_not_found
        render json: { error: "Instructor not found" }, status: :not_found
    end
end
# \- Create, read, update and delete **Instructors**