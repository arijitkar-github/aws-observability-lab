# AWS EC2 + Splunk Observability Lab

## 🚀 Project Objective

To build a simulated real-world log monitoring stack using AWS EC2 and Splunk, enabling real-time log ingestion, analysis, and dashboarding for Linux and Windows systems.

## 🏗️ Architecture Overview

- AWS VPC: Custom Virtual Private Cloud with public and private subnets.
- EC2 Instances: Linux and Windows VMs for log generation.
- Splunk Forwarders: Installed on instances to stream logs.
- Splunk Server: Central instance to index and visualize logs.
- Dashboards & Alerts: Built in Splunk for real-time insights.

## ⚙️ Technologies Used

| Tool          | Purpose                        |
| ------------- | ------------------------------ |
| AWS EC2       | Compute Instances              |
| AWS VPC       | Network Isolation              |
| Splunk        | Log Collection & Visualization |
| Linux/Windows | Log Generators                 |
| Bash          | EC2 Setup Scripts              |

## 🔍 Features

- ✅ Real-time log ingestion from Linux and Windows
- ✅ Splunk alerts on system anomalies
- ✅ Dashboards for CPU, memory, and disk usage
- ✅ Custom parsing for structured log insights

## 📁 Repo Structure

aws-observability-lab/
├── scripts/
│ └── install_splunk.sh
├── splunk/
│ └── dashboards/
├── diagrams/
│ └── architecture.png
└── README.md