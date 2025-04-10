param($event)

Write-Host "GuardDuty finding received!"
Write-Host ($event | ConvertTo-Json -Depth 5)

# Simulated response action
Write-Host "Simulated: Would isolate EC2 instance or disable access key"
