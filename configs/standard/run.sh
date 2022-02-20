echo "RUNNING SCRIPT"

#CURRENT_DIR=$(pwd)
CURRENT_DIR="/data/nfs/www/filegator/repository/standard"
TEST_DIR="${CURRENT_DIR}/test-suite"
ARCHIVE_DIR="${CURRENT_DIR}/archived"
ANSWERS_DIR="${CURRENT_DIR}/answers"

cd "$TEST_DIR"
# Get all files with javascript extension
FILES=$(ls | egrep '\.js$')

for f in $FILES
do
    echo "Processing $f"
    now=$(date +"%FT%T")

    # get results
    result_path="${ANSWERS_DIR}/${now}-${f}-results.txt"
    standard "$f" > "$result_path"
#    npx standard "$f" > "$result_path"

    # archive script files
    archive_path="${ARCHIVE_DIR}/$f"
    mv "$f" "$archive_path"
done

echo "END OF SCRIPT"
