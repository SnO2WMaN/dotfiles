FILES_BASE_DIR="$(cd $(dirname $0); pwd)/../files/"

# for file in `find $FILES_BASE_DIR -type f | sort | xargs readlink -f`;
# do
#   target=~/$(realpath --relative-to=$FILES_BASE_DIR $file)
#   mkdir -p $(dirname $target) && ln -snfv $file $target
# done

FILES_EXPECT_DOT_D=`find $(/bin/ls -1A . | /bin/grep -v .d$) -type f | /bin/xargs readlink -f | sort`
FILES_DOT_D=`/bin/ls -1A $FILES_BASE_DIR | /bin/grep .d$ | /bin/xargs readlink -f | sort`

for file in $FILES_EXPECT_DOT_D
do
	target=~/$(realpath --relative-to=$FILES_BASE_DIR $file)
	mkdir -p $(dirname $target) && ln -snfv $file $target
done

for dotd in $FILES_DOT_D
do
	target=~/$(realpath --relative-to=$FILES_BASE_DIR $dotd)
	mkdir -p $(dirname $target) && ln -snfv $dotd $target
done
