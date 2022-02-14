
pipeline {
    agent any
    environment {
	
	   AWS_ROLE = "subham-cicd-jenkins"
           AWS_REGION='us-east-2'
           AWS_ACCOUNT = '947666650043'
           AWS_ENVIRONMENT = "preprod"
           STACK_NAME = "test"
	   APP_NAME = 'my-dbname'
	   STATE_BUCKET_PREFIX='mysubhambucket'   
    }
    
    tools {
        terraform 'terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'main', url: 'https://github.com/subhampanda/CI.git'
            }
        }
        stage ("terraform init") {
            steps {
                 genericBuild(
                    image: 'hashicorp/terraform:latest',
                    aws: [
                        roleAccount:"${AWS_ACCOUNT}",
                        role: "${AWS_ROLE}",
                        region: "${AWS_REGION}"
                    ]
                 )
            }
        }
        stage ("terraform fmt") {
            steps {
                sh 'terraform fmt'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage ("terrafrom plan") {
            steps {
                sh 'terraform plan '
            }
        }
        stage ("terraform apply") {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
