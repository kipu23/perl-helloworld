Backtrack git commit number (SHA number) in perl scripts (or any other text files)



Method 1, using ident attribute in .gitattributes (WRONG SOLUTION)
(https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes)

This method replaces the $Id:$ string in the perl script with a hash of the file during checkout. The problem is, that this hash is not the SHA-1 of the commit, but of the blob itself. So this method doesn't work as expected, this is not a good solution!

Usage: 
- .gitattributes:
	*.pl ident

- perl script:
	print("$Id:$");





Method 2, using export-subst attribute in .gitattributes
(https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes)

With this solution, we need to archive the files with git, because this step replaces the $Format:%h$ string in the perl script with the commit SHA. If we use jenkins, we need another step, which extracts this archive file before loading to the artifactory.

- .gitattributes:
	*.pl export-subst

- git command:
	git archive --format=zip --output=helloworld.zip master
	
- create git archive:
			steps {
				sh "git archive --format=zip --output=helloworld.zip HEAD"
				sh "unzip -o helloworld.zip"
				sh "rm helloworld.zip"
			}

- perl script:
	print("Commit SHA: $Format:%h$");





Method 3, using unix command during jenkins build

This method simply runs a unix command to replace a string in the perl script. The `git rev-parse HEAD` nested command returns the last commit SHA. The sed command replaces ThisWillBeReplaced string in the script.

- unix command:
	sed -i "s/ThisWillBeReplaced/`git rev-parse HEAD`/" *.pl
	
- jenkins step:
			steps {
				sh 'sed -i "s/ThisWillBeReplaced/`git rev-parse HEAD`/" *.pl'
			}

- perl script:
	print("Commit SHA: ThisWillBeReplaced");



Conclusion: However, I tried to use .gitattributes to achive the nicest solution, method 3 looks for me the simplest and easiest one.

