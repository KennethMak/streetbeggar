class ProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :user_signed_in?, only: [:new, :create, :edit, :update, :destroy]

	def index
		@projects = if params[:search]
			Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
		else
			Project.all
		end
	end

	def show
		@project = Project.find(params[:id])
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
		params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:id, :amount, :description, :_destroy])
	end

end
