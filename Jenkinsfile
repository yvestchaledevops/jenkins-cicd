pipeline {
  agent any
  environment {
    DOCKER_IMAGE = "mawed33/myapp:1.0"
    EC2_IP = "${env.EC2_IP}"
  }
  stages {
    stage('Cloner') {
      steps {
        git branch: 'main', url: 'https://github.com/mawed22/TP-Jenkins-ci-app.git'
      }
    }
    stage('Build') {
      steps {
        sh 'sudo docker build -t $DOCKER_IMAGE .'
      }
    }
    stage('Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
          sh 'sudo echo $PASS | sudo docker login -u $USER --password-stdin'
          sh 'sudo docker push $DOCKER_IMAGE'
        }
      }
    }
    stage('Deploy') {
      steps {
        sshagent(['ec2-key']) {

          sh 'scp -o StrictHostKeyChecking=no  deploy.sh ubuntu@$EC2_IP:/home/ubuntu/'
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@$EC2_IP "bash deploy.sh $DOCKER_IMAGE"'
        }
      }
    }
  }
}