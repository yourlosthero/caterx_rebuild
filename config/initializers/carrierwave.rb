if Rails.env.production?
  CarrierWave.configure do |config|
    config.aws_acl    = 'public-read'

    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    config.aws_attributes = {
      expires: 1.year.from_now.httpdate,
      cache_control: 'max-age=31536000'
    }

    config.aws_credentials = {
      :access_key_id     => ENV.fetch('AWS_ACCESS_KEY_ID'),
      :secret_access_key => ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      :region                => ENV.fetch('AWS_REGION')
    }

    # For testing, upload files to local `tmp` folder.
    if Rails.env.test? || Rails.env.cucumber?
      config.storage = :file
      config.enable_processing = false
      config.root = "#{Rails.root}/tmp"
    else
      config.storage = :aws
    end

    config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

    config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
  end
end