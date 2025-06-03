#!/bin/bash

# Environment variable from argument
ENVIRONMENT=$1

# Function to check number of arguments
check_num_of_args() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# Function to activate environment
activate_infra_environment() {
    echo "Activating infrastructure for '$ENVIRONMENT'..."

    case "$ENVIRONMENT" in
        local)
            echo "Running script for Local Environment..."
            ;;
        testing)
            echo "Running script for Testing Environment..."
            ;;
        production)
            echo "Running script for Production Environment..."
            ;;
        *)
            echo "❌ Invalid environment specified. Use: local, testing, or production."
            exit 2
            ;;
    esac
}

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "❌ AWS CLI is not installed. Please install it."
        exit 1
    fi
}

# Function to check if AWS_PROFILE is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "❌ AWS_PROFILE environment variable is not set."
        exit 1
    fi
}

# Function to create EC2 instances
create_ec2_instances() {
    instance_type="t2.micro"
    ami_id="ami-0cd59ecaf368e5ccf"
    count=2
    region="us-east-1"
    key_name="ken"  # Make sure this exists

    echo "Creating $count EC2 instance(s) in $region..."

    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count "$count" \
        --key-name "$key_name" \
        --region "$region"

    if [ $? -eq 0 ]; then
        echo "✅ EC2 instances created successfully."
    else
        echo "❌ Failed to create EC2 instances."
    fi
}

# Function to create S3 buckets
create_s3_buckets() {
    company="datawisemend"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    region="us-east-1"

    for department in "${departments[@]}"; do
        bucket_name=$(echo "${company}-${department}-data-bucket" | tr '[:upper:]' '[:lower:]')

        echo "Creating bucket: $bucket_name..."

        aws s3api create-bucket --bucket "$bucket_name" \
            --region "$region" 
            
        if [ $? -eq 0 ]; then
            echo "✅ S3 bucket '$bucket_name' created successfully."
        else
            echo "❌ Failed to create S3 bucket '$bucket_name'."
        fi
    done
}

# ==== Execution Order ====

check_num_of_args "$@"
activate_infra_environment
check_aws_cli
check_aws_profile
create_ec2_instances
create_s3_buckets
