require 'refile/s3'
Refile.backends['store'] = Refile::Backend::FileSystem.new('app/assets/images/')
# aws = {
#   access_key_id: ENV['AWS_KEY'],
#   secret_access_key: ENV['AWS_SECRET'],
#   region: 'us-east-1',
#   bucket: ENV['S3_BUCKET']
# }
# Refile.cache = Refile::S3.new(prefix: 'draft/cache', **aws)
# Refile.store = Refile::S3.new(prefix: 'draft/store', **aws)

# Refile.cdn_host = 'https://dv06kklv04v3l.cloudfront.net'
