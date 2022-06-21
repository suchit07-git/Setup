for i in `seq 1 100`; do
	echo $i
    ./$1 $i 4 5 > input.txt
    ./$2 < input.txt > output.txt
	./$3 < input.txt > answer.txt
	diff -c output.txt answer.txt || break
done
