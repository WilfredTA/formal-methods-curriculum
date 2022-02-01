image: Dockerfile
	sudo docker build -t fv-image .

run:
	sudo docker run -it -v $(PWD)/mnt:/mnt fv-image:latest bash
