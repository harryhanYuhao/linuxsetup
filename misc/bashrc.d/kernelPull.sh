declare update

if ! [ -f ~/.cache/kernelPull ]; then
	touch ~/.cache/kernelPull
	update=1
fi

recordedDate=`cat ~/.cache/kernelPull`
curDate=`date -Idate`

if ! [ "$recordedDate" = "$curDate" ]; then
	update=1
fi

function pullKernel {
	cd ~/linux
	git pull
}

if [[ $update &&  -d ~/linux ]]; then
	date -Idate > ~/.cache/kernelPull
	(nohup pullKernel > /dev/null 2>&1 &)
	echo Pulling Kernel! 
fi
