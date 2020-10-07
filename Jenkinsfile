pipeline {
	agent any
	
	stages {
		stage("Method 2") {
			steps {
				sh "git archive --format=zip --output=helloworld.zip HEAD"
				sh "unzip -o helloworld.zip"
			}
		}
		
		stage("Method 3") {
			steps {
				sh 'sed -i "s/ThisWillBeReplaced/`git rev-parse HEAD`/" *.pl'
			}
		}
	}
}
