class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update, :destroy]
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
         if @employee.save
            redirect_to @employee
         else
            render :new
        end

    end

    def edit
    end

    def update
        if @employee.update(employee_params)
            redirect_to @employee
        else
            render :edit
        end
        
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    private
    def find_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
