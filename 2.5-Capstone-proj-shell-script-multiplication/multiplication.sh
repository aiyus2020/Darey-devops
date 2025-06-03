#!/bin/bash

# Ask for the number
read -p "Enter a number: " number

# Ask if user wants full or partial
read -p "Do you want 'full' or 'partial' multiplication? " choice

if [[ "$choice" == "full" ]]; then
    echo "Full Multiplication Table for $number:"
    for ((i=1; i<=10; i++)); do
        echo "$number x $i = $((number * i))"
    done

elif [[ "$choice" == "partial" ]]; then
    read -p "Enter starting number: " start
    read -p "Enter ending number: " end

    if [[ "$start" -le "$end" ]]; then
        echo " Partial Multiplication Table for $number from $start to $end:"
        for ((i=start; i<=end; i++)); do
            echo "$number x $i = $((number * i))"
        done
    else
        echo " Invalid range. Start should be less than or equal to End."
    fi

else
    echo "Invalid choice. Please enter either 'full' or 'partial'."
fi
