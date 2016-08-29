class UsersController < ApplicationController
  def create_user

  end

  def update_user

    user = User.find_by_unique_device_token(params[:unique_device_token])
    point = "POINT (#{params[:longitude]} #{params[:latitude]})"
    unless user
      user = User.create(
      unique_device_token: params[:unique_device_token],
      location: point)
    else
      user.update_attributes(location: point)
    end

    puts "----------------------"
    puts "this is user: #{user}"
    puts "----------------------"

    if params[:requesting_plunger]
      deliverer = Delivery.where(requestor_id: user.id).where(delivered: false).first
      return deliverer
    else
      # geolocation query for anyone requesting plungers within a 100 feet
      requestor = User.where.not(id: user.id).where(requesting_plunger: true).search_plunger_requestors(user.location.lat, user.location.lon, 1000).first

      puts "-------------------"
      puts "this is requestor: #{requestor}"
      puts "-------------------"
      render json: requestor
    end

  end

  def request_plunger
    user = User.find_by_unique_device_token(params[:unique_device_token])
    user.update_attributes(requesting_plunger: true)

    render nothing: true, status: :ok
  end

  def accept_job
    user = User.find_by_unique_device_token(params[:unique_device_token])
    delivery = Delivery.create(
      deliverer_id: user.id,
      requestor_id: params[:requestor_id],
      delivered: false
      )
    render nothing: true, status: :ok
  end

  def complete_job
    delivery = Delivery.where(deliverer_id: params[:deliverer_id], requestor_id: params[:requestor_id]).first
    delivery.update_attributes(delivererd: true)
  end

  private
  def user_params
    params.permit :name, :username, :unique_device_token, :latitude, :longitude
  end

end
