pipeline {
	agent any

	stages {
		stage("Build") {
			steps {
				sh "git rev-parse HEAD"
				sh './addgitSHA.sh'
			}
		}
	}
}
