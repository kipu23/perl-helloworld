pipeline {
	agent any

	stages {
		stage("Method 2") {
			steps {
				sh "git archive --format=zip --output=helloworld.zip master"
			}
		}
		stage("Method 3") {
			steps {
				sh './addgitSHA.sh'
			}
		}
	}
}
