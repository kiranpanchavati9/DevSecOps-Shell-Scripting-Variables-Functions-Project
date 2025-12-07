for FRUIT in apple, banana, orange; do
  echo Fruit Name: $FRUIT
  sleep 1
done


X=5
while [ $X -gt 0 ]; do
  echo "Value: $X"
  X=$((X-1))
  sleep 2
done
