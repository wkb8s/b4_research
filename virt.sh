virt-install \
	--name ubuntu2004 \
	--vcpus 1 \
	--memory 8192 \
	--os-variant ubuntu20.04 \
	--graphics none \
	--extra-args "console=ttyS0 --- console=ttyS0" \
	--location http://us.archive.ubuntu.com/ubuntu/dists/focal/main/installer-amd64/
