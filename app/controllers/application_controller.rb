class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def ensure_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

  def ensure_relation
    if current_user.id != params[:user_id].to_i
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name sex postal_code prefecture_code city])
  end
end
