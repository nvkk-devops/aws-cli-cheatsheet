export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=me-south-1
export s3_bucket_name=fileupload-test-bucket
export s3_assume_role_arn=arn:aws:iam::1212121212:role/s3-test-Role
export s3_role_session_name=sample-test-session-1

aws s3 ls s3://${s3_bucket_name}
aws s3 cp s3://${s3_bucket_name}/filename.jpeg .

aws sts assume-role --role-arn ${s3_assume_role_arn} --role-session-name ${s3_role_session_name}
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_SESSION_TOKEN=""
export AWS_DEFAULT_REGION=me-south-1
export s3_bucket_name=

aws sts get-caller-identity

unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN

aws s3 ls s3://${s3_bucket_name}