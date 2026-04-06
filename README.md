# comp3800sef-final

## For groupmates:
Use a Debian-based distro (debian 11 works), clone the repository.

Make sure **SDKMAN!** is installed via `curl -s "https://get.sdkman.io" | bash`.

Install Gradle and Java 21 via `sdk install java 21.0.10-amzn` and `sdk install gradle`.

Use `sdk use java 21.0.10-amzn` to use Java 21 for the current shell.

Run `./gradlew bootRun` to test this project.

Additionally, run `./gradlew classes --continuous` **IN A SEPARATE SHELL** to begin continuous development.