CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
        provider: 'AWS',
        # IAMユーザー作成時のアクセスキーID、シークレットアクセスキー
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        region: 'ap-northeast-1',
        # path_style: true,
  }
  # パブリックオブジェクトとしてアップロードするかどうか
  config.fog_public = false
  # 有効期限を表すメタデータの付与
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  case Rails.env
    when 'production'
      # 作成したバケット名
      config.fog_directory = 'photos-sample-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/photos-sample-production'
    when 'development'
      config.fog_directory = 'photos-sample-development'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/photos-sample-development'
  end
end
