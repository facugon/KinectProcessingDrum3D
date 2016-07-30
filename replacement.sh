
while read lin
do
    uno=`echo "$lin" | sed 's/(//g'`
    dos=`echo "$uno" | sed 's/)//g'`
    tre=`echo "$dos" | sed 's/\[//g'`
    cua=`echo "$tre" | sed 's/\]//g'`
    cin=`echo "$cua" | sed 's/ /_/g'`

    mv "$lin" $cin
done < file
