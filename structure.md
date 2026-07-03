TerraCore/
│
├── backend/
│   ├── dev.hcl
│   ├── qa.hcl
│   └── prod.hcl
│
├── environments/
│   ├── dev/
│   │   └── terraform.tfvars
│   │
│   ├── qa/
│   │   └── terraform.tfvars
│   │
│   └── prod/
│       └── terraform.tfvars
│
├── modules/
│   │
│   ├── resource-group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── virtual-network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── subnet/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── nsg/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── nsg-association/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── route-table/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── public-ip/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── application-gateway/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── vmss/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── sql-database/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── storage-account/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├
│   │ 
│   │
│   ├── managed-identity/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── log-analytics/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── monitor/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── diagnostic-settings/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── recovery-services-vault/
│      ├── main.tf
│      ├── variables.tf
│      └── outputs.tf
│   
│   
│
├── scripts/
│   ├── install-nginx.sh
│   └── install-app.sh
│
├── provider.tf
├── versions.tf
├── backend.tf
├── main.tf
├── variables.tf
├── locals.tf
├── outputs.tf
├── .gitignore
└── README.md