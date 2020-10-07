pipeline {
	agent any

	stages {
		stage("Build") {
			steps {
				sh "git rev-parse HEAD"
				sh "git rev-parse HEAD >> version.txt"
			}
		}
	}
	
	post {
		always {
			cleanWs()
		}
	}
}
