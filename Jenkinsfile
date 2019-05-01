#!groovy

pipeline {
  agent {
    docker {
      image 'geodynamics/conman-buildenv-bionic'
      alwaysPull true
    }
  }

  options {
    timeout(time: 2, unit: 'HOURS')
  }

  stages {
    stage('Build') {
      steps {
        sh '''
          cd src
          make -f Makefile-gfort64
        '''
      }
    }
  }
}
