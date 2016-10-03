RESULTDIR=result
DATADIR=data

mkdir -p "${RESULTDIR}"
mkdir -p "${DATADIR}"

length=$(wc -l "${DATADIR}/dbpedia_csv/train.csv" | awk '{print $1}')
echo $length
total=5
for (( i = 0; i < total; i++ )); do
	#statements
	scale=$(bc <<< "scale=2;(($i+1)/$total)*$length")
	scale=${scale%.*}
	head -n $scale "${DATADIR}/dbpedia_csv/train.csv" > "${DATADIR}/first$scale.csv"
	echo "Item $scale"
done