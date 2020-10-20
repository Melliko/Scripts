#!/bin/awk -f

BEGIN {
}
{
split($0, array, ",");
for (i in array)
	print array[i];
}
END {

}
