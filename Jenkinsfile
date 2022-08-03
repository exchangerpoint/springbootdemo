pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    environment {
registry = "exchangerpoint/demorepo"
registryCredential = 'dockerhubid'
dockerImage = ''
}
    stages {
        stage('Install') {
            steps {
                sh 'mvn install'
            }
        }
        stage('Building our image') {
steps{
sh 'docker build -t exchangerpoint/demorepo:latest'
}
}
stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhubid', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push exchangerpoint/demorepo:latest:latest'
        }
      }
    }
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
    }
}
