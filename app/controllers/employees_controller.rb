class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update]

    def index 
        @employees = Employee.all 
    end

    def new
        @employee = Employee.new 
        @dogs = Dog.all 
    end

    def create 
        @dogs = Dog.all 
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employee_path(@employee)
        else  
            render :new
        end
    end

    def update 
        @dogs = Dog.all 
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else  
            render :edit 
        end
    end


    private 

    def find_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name,
        :alias, :title, :office, :img_url, :dog_id )
    end

end
