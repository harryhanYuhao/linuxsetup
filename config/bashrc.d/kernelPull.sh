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
	if [ $? -eq 0 ]; then
		date -Idate > ~/.cache/kernelPull
	fi
}

if [[ $update &&  -d ~/linux ]]; then
	(pullKernel &)
	echo Pulling Kernel! 
fi
