# AWS Automated Threat Detection & Response

This project uses **AWS GuardDuty** with a **Lambda function** to automatically respond to detected security threats, such as unauthorized API calls or reconnaissance attempts.

## 🔒 How It Works
- GuardDuty is enabled and configured across regions.
- When a finding is triggered, it invokes a Lambda function.
- The Lambda analyzes the threat and takes action (e.g., isolate EC2, notify via SNS).

## ⚙️ Stack
- AWS GuardDuty
- AWS Lambda (Python)
- IAM (least privilege roles)
- Terraform

## 🚀 Deploy
1. Configure your AWS CLI
2. Run `terraform init && terraform apply`
3. Deploy Lambda function zip if separated

## 🔍 Sample Actions
- Tagging compromised EC2
- Sending alerts to security team
- Disabling access keys
