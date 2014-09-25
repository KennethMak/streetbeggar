class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		
	end

	def new
		@project = Project.new
		@project.rewards.build
	end

	def edit
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else
			render :new
		end
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to projects_path
		else
			render :edit
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:amount, :description])
	end

end