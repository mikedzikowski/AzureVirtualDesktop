# Azure Virtual Desktop Solution

[**Home**](../../readme.md) | [**Features**](../features.md) | [**Design**](../design.md) | [**Prerequisites**](../prerequisites.md) | [**Post Deployment**](../post.md) | [**Troubleshooting**](../troubleshooting.md)

## Features

- [**Auto Increase Premium File Share Quota**](./autoIncreasePremiumFileShareQuota.md#auto-increase-premium-file-share-quota)
- [**Backups**](./backups.md#backups)
- [**Drain Mode**](./drainMode.md#drain-mode)
- [**FSLogix**](./fslogix.md#fslogix)
- [**GPU Drivers & Settings**](./gpu.md#gpu-drivers--settings)
- [**High Availability**](./highAvailability.md#high-availability)
- [**Monitoring**](./monitoring.md#monitoring)
- [**Scaling Tool**](./scalingTool.md#scaling-tool)
- [**Server-Side Encryption with Customer Managed Keys**](./serverSideEncryption.md#server-side-encryption)
- [**SMB Multichannel**](./smbMultiChannel.md#smb-multichannel)
- [**Start VM On Connect**](./startVmOnConnect.md#start-vm-on-connect)
- [**Trusted Launch**](./trustedLaunch.md#trusted-launch)
- [**Validation**](./validation.md#validation)
- [**Virtual Desktop Optimization Tool**](./virtualDesktopOptimizationTool.md#virtual-desktop-optimization-tool-vdot)

### Scaling Tool

This feature is automatically deployed if a "pooled" host pool is selected to help save on cost.  Based on the desired configuration, session hosts will scale up during peak hours and shutdown after peak hours.  It is recommended to use policies to manage idle and disconnected over using the built-in capability in this tool. In this solution, a managed identity is deployed on the Automation Account to reduce the privileges needed for tool.  This feature will be replaced by Autoscale when it becomes "Generally Available" in Azure Cloud and Azure US Government.

**Reference:** [Scaling Tool - Microsoft Docs](https://docs.microsoft.com/en-us/azure/virtual-desktop/scaling-automation-logic-apps)

**Deployed Resources:**

- Automation Account
  - Job Schedules
  - PowerShell Modules
  - Runbook
  - Schedules
  - System Assigned Identity
  - Variable
  - Webhook
- Role Assignment
