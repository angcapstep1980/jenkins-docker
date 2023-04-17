pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('angelocapone')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker untag angelocapone/modelonweb'
		sh 'docker rmi modelonweb --force'
		sh 'docker build -t modelonweb .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
		sh 'docker tag modelonweb angelocapone/modelonweb'
		sh 'docker push angelocapone/modelonweb'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}