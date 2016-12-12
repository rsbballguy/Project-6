export filename=$1

if [[ -e $filename ]];
then
    echo "Count Number of Lines in File:" 
    wc -l $1
    echo "Count Number of Words in File:"
    wc -w $1
    echo "Find the Most Repetitive Word in the File:"
    cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | head -n 1
    echo "Find the Least Repetitive Word in the File:"
    cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | tail -n 1
    echo "Starts With “d” and Ends With “d”, Words Can be Both Upper and Lower Case"
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '[d|D][a-zA-Z]\{0,\}[d|D]' | sort | uniq -c | sort -bnr
    echo "Starts with “A” or “a” "
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '^[a|A][a-zA-Z]*' | sort | uniq -c | sort -bnr
    echo "Count the Numeric Words "
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '[0-9]\{1,\}' | grep -v -e '[a-zA-Z@,$\(\)";]\{1,\}' | sort | wc -l
    echo "Count the Alphanumeric Words"
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '^[a-zA-Z0-9_]*$' | sort | wc -l
else
    echo "File is not provided or file does not exist"
fi
