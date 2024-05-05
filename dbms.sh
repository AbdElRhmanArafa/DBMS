#!/bin/bash



# Database Management Functions

dbms () {
    while true; do
    echo ""
    echo "DataBase Engine : "
    echo "1. Create Database :"
    echo "2. List Database"
    echo "3. connect to Database"
    echo "4. Drop Database"
    echo "5. Exit"
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
    echo "8. Change database"
    echo "9. Exit"
    echo "Enter your choice:"
    read choice
    case $choice in
        1) echo "create_table" ;;
        2) echo "list_tables" ;;
        3) echo "drop_table" ;;
        4) echo "insert_into_table" ;;
        5) echo "select_from_table" ;;
        6) echo "delete_from_table" ;;
        7) echo "update_table" ;;
        8) dbms;;
        9) echo "Exiting..."; break ;;
        *) echo "Invalid choice";;
    esac
    done
}
