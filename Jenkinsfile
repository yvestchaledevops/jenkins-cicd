pipeline {
  agent any
  environment {
    DOCKER_IMAGE = "mawed22/TP-app"
  }
  stages {
    stage('Cloner') {
      steps {
        git 'https://github.com/mawed22/TP-Jenkins-ci-app.git'
      }
    }
    stage('Build') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }
    stage('Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh 'docker push $DOCKER_IMAGE'
        }
      }
    }
    stage('Deploy') {
      steps {
        sshagent(['ec2-key']) {
          sh 'scp deploy.sh ubuntu@${EC2_IP}:/home/ubuntu/'
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@${EC2_IP} "bash deploy.sh $DOCKER_IMAGE"'
        }
      }
    }
  }
}