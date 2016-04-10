class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    generate_authentication_token

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :signed_up if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end


  private

  def generate_authentication_token
    loop do
      resource.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: resource.authentication_token)
    end
  end


end
