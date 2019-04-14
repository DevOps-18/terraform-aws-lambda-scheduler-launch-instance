# Deploy two lambda for testing with awspec

module "launch-my-instance-from-monday-to-friday" {
  source                         = "diodonfrost/lambda-scheduler-launch-instance/aws"
  name                           = "launch-instance"
  cloudwatch_schedule_expression = "cron(0 07 ? * MON-FRI *)"

  instance_params = {
    ami_id        = "ami-07683a44e80cd32c5"
    instance_type = "t2.micro"
    keypair       = "ippon-df"
    sg_ingress    = "22,80,443"

    # Value must be in base64
    user_data = "IyEvdXNyL2Jpbi9lbnYgYmFzaAplY2hvIHRlc3QgPiAvdG1wL3Rlc3QudHh0CmFtYXpvbi1saW51eC1leHRyYXMgaW5zdGFsbCAteSBhbnNpYmxlMgp5dW0gaW5zdGFsbCAteSBubWFwCgo="
  }
}
