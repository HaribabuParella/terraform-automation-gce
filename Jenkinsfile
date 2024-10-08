pipeline {
    agent any


    environment {
    SVC_ACCOUNT_KEY = credentials('TERRAFORM-AUTH')
  }
     
    stages {
          

	stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
		    credentials = file("terraform.json")
                }
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./terraform.json'
                sh 'terraform --version' 
		sh 'pwd'
		sh 'gcloud config list'
               
            }
        }
	    
	   
        
         stage('Initialize Terraform') {
		  steps {
		 
                sh 'terraform init'
	 }
	 }
		
	stage('Terraform plan') {
		 steps {
		
		 sh 'terraform plan'
	}
	}
	stage('Terraform Action') {
		 steps {
		
		 sh 'terraform $ACTION --auto-approve'
	}
	}
}
}
