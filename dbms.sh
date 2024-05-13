#!/bin/bash


# shellcheck source=somefile
source ./showintables.sh

# Database Management Functions
MainPath=$(pwd)
dbms () {
    while true; do
    echo ""
    echo "DataBase Engine : "
    echo "1. Create Database"
    echo "2. List Database"
    echo "3. connect to Database"
    echo "4. Drop Database"
    echo "5. Exit"
    read -r choice
    case $choice in
        1) create_data_base;;
        2) list_data_base;;
        3) Switch_to_DB;;
        4) drop_db;;
        5) echo "Exiting..."; exit ;;
        *) echo "Invalid choice";;
        esac 

    done

}


# Display the main menu about DBMS.

databaseMenu (){
    
    while true; do
    echo ""
    echo "$1 is connecting ... "
    echo "Database Menu:"
    echo "1. Create Table"
    echo "2. List Tables"
    echo "3. Drop Table"
    echo "4. Insert Into Table"
    echo "5. Select From Table"
    echo "6. Delete From Table"
    echo "7. Update Table"
    echo "8. Back to database engine "
    echo "9. Exit"
    echo "Enter your choice:"
    read -r choice
    case $choice in
        1) echo "create_table" ;;
        2) echo "list_tables" ;;
        3) echo "drop_table" ;;
        4) echo "insert_into_table" ;;
        5) echo "select_from_table" ;;
        6) echo "delete_from_table" ;;
        7) echo "update_table" ;;
        8) cd "$MainPath" || exit;dbms;;
        9) echo "Exiting..."; exit ;;
        *) echo "Invalid choice";;
    esac
    done
}

create_data_base() 
{
    echo ""
    echo "Enter database name: "
    read -r database
    #check if dir database found 
    if [[ -d "DataBase" ]] > /dev/null ;then
        cd ./DataBase || exit
        if [[ -d "$database" ]] > /dev/null ;then
            echo "Data base are ready exit"
            dbms
        fi
        mkdir "$database"
        cd ./"$database" || exit
        echo "Data base is creating and Now your using $database "
        databaseMenu "$database"
        
    else 
        mkdir DataBase
        cd ./DataBase || exit
        mkdir "$database"
        cd ./"$database" || exit
        echo "Data base is creating and Now your using $database "
        databaseMenu "$database"
    fi      
}

list_data_base ()
{
    if [[ -d "DataBase" ]];then
     # Initialize an empty array
        list_database=()
        
        # Fill the array using a for loop
        for db_dir in ./DataBase/*; do
            if [ -d "$db_dir" ]; then  # Ensure it's a directory
                db_name=$(basename "$db_dir")
                list_database+=("$db_name")
            fi
        done     
    if [ ${#list_database[@]} -eq 0 ]; then
        echo "No Database Founded try to create database first ..."
        dbms
    fi    
    show_database "${list_database[@]}"
    dbms

    else
    
        echo "error : DataBase file Not found please try to create database first"\
        dbms
    fi
}


Switch_to_DB ()
{
    if [[ -d "DataBase" ]];then
        # list all dir inside Data./dbms.sh: line 96: show_database: command not found"$"
        # Initialize an empty array
        list_database=()
        
        # Fill the array using a for loop
        for db_dir in ./DataBase/*; do
            if [ -d "$db_dir" ]; then  # Ensure it's a directory
                db_name=$(basename "$db_dir")
                list_database+=("$db_name")
            fi
        done     
    if [ ${#list_database[@]} -eq 0 ]; then
        echo "No Database Founded try to create database first ..."
        dbms
    fi     
    show_database "${list_database[@]}"
    read -p  "Enter the ID number of database : "  -r id
    ((id--))
    if [ "$id" -ge ${#list_database[@]} ]; 
    then
        echo "id $id is not found back to main dbms"
        dbms
    fi
    element="${list_database[$id]}"
    echo "$element"
    cd ./DataBase/"$element" || exit
    databaseMenu "$element"

    else
    
        echo "error : DataBase file Not found please try to create database first"
        dbms

    fi
}

drop_db()
{
    if [[ -d "DataBase" ]];then
        # Initialize an empty array
        list_database=()
        
        # Fill the array using a for loop
        for db_dir in ./DataBase/*; do
            if [ -d "$db_dir" ]; then  # Ensure it's a directory
                db_name=$(basename "$db_dir")
                list_database+=("$db_name")
            fi
        done     
    if [ ${#list_database[@]} -eq 0 ]; then
        echo "No Database Founded try to create database first ..."
        dbms
    fi    
    show_database "${list_database[@]}"
    read -p  "Enter the ID number of database want to drop: "  -r id
    ((id--))
    if [ "$id" -ge ${#list_database[@]} ]; 
    then
        echo "id $id is not found back to main dbms"
        dbms
    fi
    element="${list_database[$id]}"
    echo "$element"
    rm -rf ./DataBase/"$element" || exit
    dbms

    else
    
        echo "error : DataBase file Not found please try to create database first"
        dbms

    fi

}
dbms
