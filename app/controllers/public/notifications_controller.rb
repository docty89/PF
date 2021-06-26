class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true) # indexを開いたらchecked:falseが全てchecked:trueになる
    end
  end

  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
end
# 通知一覧表示
# 見たら未読false → 既読trueと変わるように指定
