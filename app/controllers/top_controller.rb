class TopController < ActionController::Base
    def main
        if session[:login_uid]
            render 'main'
        else
            render 'login'
        end
    end
    
    def login
        if User.find_by(uid: params[:uid], pass: params[:pass])
        #if params[:uid] == User.find_by(uid) and params[:pass] == User.find_by(pass)
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'login_failed'
        end
    end
    
    def logout
       session.delete(:login_uid)
       redirect_to root_path
    end
    
end
