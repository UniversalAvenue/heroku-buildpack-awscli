#!/bin/bash
INSTALL_DIR="/app/vendor/awscli"
chmod +x /app/vendor/awscli-bundle/install
/app/vendor/awscli-bundle/install -i $INSTALL_DIR
chmod u+x $INSTALL_DIR/bin/aws

echo "PATH=$INSTALL_DIR/bin:$PATH" > .profile.d/awscli-defaults.sh

mkdir ~/.aws

cat >> ~/.aws/credentials << EOF
[default]
aws_access_key_id = $AWS_KEY
aws_secret_access_key = $AWS_SECRET_KEY
EOF

cat >> ~/.aws/config << EOF
[default]
region = $AWS_REGION

[preview]
cloudfront = true
EOF
