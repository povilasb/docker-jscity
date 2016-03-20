image_tag := povilasb/jscity

image:
	docker build -t $(image_tag) .
.PHONY: image

container:
	docker run --name povilasb-jscity -d -p 8888:8888 \
		-t $(image_tag)
.PHONY: container
