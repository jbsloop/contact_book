class Admin::AdminController < ApplicationController
    before_action :ensure_admin

    def ensure_admin
        if current_user.admin?
        
        else
            redirect_to '/404'
        end
    end
end