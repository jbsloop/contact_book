class Admin::UsersController < Admin::AdminController
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
        @user = User.find(params[:user_id])

        if @user.admin?
            redirect_to admin_users_url, notice: "Cannot delete an administrator"
        elsif @user == current_user
            redirect_to admin_users_url, notice: "Cannot delete Current User"
        else
            @user.destroy
            redirect_to admin_users_url
        end
    end
end