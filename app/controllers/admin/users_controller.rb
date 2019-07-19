class Admin::UsersController < Admin::AdminController
    before_action :set_user, only: [:delete]

    def index
        @users = User.all
        
    end

    def  change_role
        @user = User.find(params[:user_id])
        if @user != current_user
            if @user.admin?
                @user.user!
            else
                @user.admin!
            end

            redirect_to admin_users_url
        else
            redirect_to admin_users_url, notice: "You cannot make yourself a User"
        end
    end

    def destroy
        @user = User.find(params[:id])

        if @user.admin?
            redirect_to admin_users_url, notice: "Cannot delete an administrator"
        else
            @user.destroy
            redirect_to admin_users_url
        end
    end

    def delete
    end

    private

        def set_user
            @user = User.find(params[:id])
        end
end