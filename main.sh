#! /bin/bash
array=0
sortedArray=0


function input(){

	echo "Enter 3 or more numbers : "	
	read -a array
	
	if [[ ${#array[@]} -lt 3 ]] 
	then
		echo "You entered less than 3 numbers"
		input
	fi
	
	local check="$(valditaion)"
	
	if [[ $check -eq 0 ]] 
	then
		echo "Enter numbers only"
		input
	else 
	selectt
	fi

}

function valditaion(){ 
	
	local flag=1
	
	for i in ${array[@]}
	do
		if [[ ! $i =~ ^[0-9]+$ ]]
		then
			flag=0
		fi
	done
	
	echo $flag
		
}

function selectt () {

select option in input displayArray displaySortedArray max min average size sum exit
do
   case $option in
     input) 
         
         input
         ;;
      displayArray) 
    
         echo "displayArray"
         printArray
         ;;
      displaySortedArray)
      echo "print sorted array"
        
         sortedArray
      ;;
      max) 
         
         result="$(Max)"
 	echo "max value $result" 
         
      ;;
       min) 
           result="$(Min)"
 	echo "min value $result"
        
      ;;
       average) 
        
         echo "Average of number is: "
          average
      ;;
       size) 
        echo "number of elements: "
         size
      ;;
       sum) 
         echo "sum of array"
         Sum 
      ;;
       exit) 
         echo "exit"
         exit
      ;;
      *) echo "ERROR: Invalid selection" 
      ;;
   esac
done
}



function sortedArray(){

#add values to sortedArray=0 and print

sortedArray=($(for l in ${array[@]}; do echo $l; done | sort -n))
for elem in ${sortedArray[@]}
do 
  echo $elem
done

}

function printArray(){

for elem in ${array[@]}
do 
  echo $elem
done

}


function Max(){
#hadeel
sortedArray=($(for l in ${array[@]}; do echo $l; done | sort -n | tail -n 1))
for elem in ${sortedArray[@]}
do 
  echo $elem
done

}
function Min(){
#hadeel
sortedArray=($(for l in ${array[@]}; do echo $l; done | sort -n | head -n 1))
for elem in ${sortedArray[@]}
do 
  echo $elem
done

}




function size(){
#balsam
local size=${#array[@]}
echo $size
}


function Sum (){

local sumElements=0
local index_counter=${#array[@]}

i=0
while [[ $i -lt $index_counter ]] 
	do
		sumElements=$(( sumElements + ${array[i]}))
		let i=i+1
	done
echo "$sumElements"

}

function average(){
#victor
local size1="$(size)"
local sum1="$(Sum)"
 let result=sum1/size1
echo $result
}



function main(){
	#check external with if 
	local check="$(valditaion)"
	if [[ ${#array[@]} -lt 3 || $check -eq 0 ]]
	then
		input
	else
		echo "ok"
		selectt
	fi
	
}


array=("$@")
main 


