class GroupsController < ApplicationController

	def new
		@group = current_user.groups.new
		1.times { @group.group_users.build}
	end

	def create
		@group = current_user.groups.create(group_params)
		respond_to do |format|
			if @group.save 
    			format.html { redirect_to @group, notice: 'Group successfully created' }
				format.json { render :show, status: :created, location: @group }
			else
				format.html { render :new }
				format.json { render json: @group.errors, status: :unprocessable_entity}\
			end
		end
	end

	def show
		@group = Group.find(params[:id])
	end

	private

	def group_params
		params.require(:group).permit(:name, :user_id,
		group_users_attributes: [:user_id, :group_id]
	)
	end
end