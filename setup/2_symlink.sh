FILES_BASE_DIR="$(cd $(dirname $0); pwd)/../files/"

for file in `find $FILES_BASE_DIR -type f | sort | xargs readlink -f`;
do
  target=~/$(realpath --relative-to=$FILES_BASE_DIR $file)
  mkdir -p $(dirname $target) && ln -snfv $file $target
done
