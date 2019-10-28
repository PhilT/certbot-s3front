docker run --rm --name lets-encrypt -it `
  -v ./letsencrypt/:/etc/letsencrypt `
  -e AWS_ACCESS_KEY_ID=$env:AWS_ACCESS_KEY_ID `
  -e AWS_SECRET_ACCESS_KEY=$env:AWS_SECRET_ACCESS_KEY `
  certbot-s3front `
    --init `
    --agree-tos `
    -a certbot-s3front:auth `
    -i certbot-s3front:installer `
    --certbot-s3front:auth-s3-bucket $env:DOMAIN `
    --certbot-s3front:auth-s3-region eu-west-2 `
    --certbot-s3front:installer-cf-distribution-id $env:CLOUDFRONT_DISTRIBUTION_ID `
    -d $env:DOMAIN `
    -d www.$env:DOMAIN
