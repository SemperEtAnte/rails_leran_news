class V1::NewsController < ApplicationController
  before_action :verify_token, except: [:list, :info]
  def create
    news = News.new(params.permit(:main_text, :short_text, :image))
    news.user = @user
    assert_save(news)
    render status: :created, json: news
  end
  def edit
    news = News.find(params[:id])
    raise Err::Exceptions::AccessDenied unless news.users_id==@user.id
    news.update(params.permit(:main_text, :short_text, :image))
    assert_save(news)
    render json: news
  end
  def delete

    news = News.find(params[:id])
    raise Err::Exceptions::AccessDenied unless news.users_id==@user.id
    news.delete
    render status: :ok
  end
  def list
    render json: News.joins(:user).includes(:user).with_attached_image.limit(params[:limit]||20).offset( (params[:limit]||20)*(params[:page]||0)), list: true
  end
  def info
    render json: News.find(params[:id]).joins(:user).includes(:user).with_attached_image
  end
end
