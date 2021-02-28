default: clean prepare create-tar create-zip

clean:
	@rm -rf target

prepare:
	@mkdir -p target/files
	@cp -r src target/files/.devcontainer
	@cp LICENSE target/files/.devcontainer/

create-tar:
	@cd target/files && tar -czf ../project-files.tar.gz $$(ls -A)

create-zip:
	@cd target/files && zip -q9r ../project-files.zip $$(ls -A)