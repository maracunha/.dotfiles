

```bash
while getopts n:b: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
        b) branch_name=${OPTARG};;
    esac
done
```
