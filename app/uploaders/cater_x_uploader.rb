class CaterXUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    storage :aws
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
      "/default_image.png"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def filename
    "#{secure_token(16)}.#{file.extension}" if original_filename
  end

  protected
  def secure_token(length = 16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end
end
