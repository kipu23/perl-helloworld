pipeline {
	agent any

	stages {
		stage("Build") {
			steps {
				sh "git rev-parse master"
				sh "git rev-parse master >> version.txt"
			}
		}
	}
	
	post {
		always {
			cleanWs()
		}
	}
}
