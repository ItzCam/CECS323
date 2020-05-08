/**
 * Aaron Ramirez
 * Parth Chhasatiya
 * Antonio Hughes 
 * Professor Brown
 * CECS 323
 * This Project uses the JDBC that we developed to connect the java to the database
 * which runs 9 queries. It contains the main menu of the project to test each part.
 */
package cecs.pkg323.java.project;

import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author Mimi Opkins with some tweaking from Dave Brown
 */
public class CECS323JavaTermProject {
    //  Database credentials
    //static String USER;
    //static String PASS;
    static String DBNAME;
    //This is the specification for the printout that I'm doing:
    //each % denotes the start of a new field.
    //The - denotes left justification.
    //The number indicates how wide to make the field.
    //The "s" denotes that it's a string.  All of our output in this test are 
    //strings, but that won't always be the case.
    static final String displayFormatGroupsAndPublishers = "%-25s%-40s%-20s%-35s\n";
    static final String displayFormatBooks = "%-25s%-40s%-40s%-35s%-25s\n";
// JDBC driver name and database URL
    static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    static String DB_URL = "jdbc:derby://localhost:1527/";
    static String groupName, headWriter, subject, publisherName, publisherAddress, publisherPhone, publisherEmail, bookTitle, userChoice;  
    static int yearFormed, yearPublished, numberPages, menuChoice;
 /**
 * Takes the input string and outputs "N/A" if the string is empty or null.
 * @param input The string to be mapped.
 * @return  Either the input string or "N/A" as appropriate.
 */
    public static String dispNull (String input) {
        //because of short circuiting, if it's null, it never checks the length.
        if (input == null || input.length() == 0)
            return "N/A";
        else
            return input;
    }
    
    public static void main(String[] args) throws SQLException {
        //Prompt the user for the database name, and the credentials.
        //If your database has no credentials, you can update this code to 
        //remove that from the connection string.
        Scanner in = new Scanner(System.in);
        System.out.print("Name of the database (not the user account): ");
        DBNAME = in.nextLine();
        
        //Constructing the database URL connection string
        DB_URL = DB_URL + DBNAME ;
        Connection conn = null; //initialize the connection
        Statement stmt = null;  //initialize the statement that we're using
        PreparedStatement pstmt = null; //initialize the prepared statement that we're using
        try {
            //STEP 2: Register JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL);

            /**
            * Create a switch statement for the user menu
            */
            menuChoice = 0;
    
            while (menuChoice != 10) {
                switch(menu(1)){

                //~~Number 1: List all writing groups~~
                case 1: 
                    //STEP 4: Execute a query
                    System.out.println("Creating statement...");
                    stmt = conn.createStatement();
                    String WritingGroups = "SELECT GroupName, HeadWriter, YearFormed, Subject FROM WritingGroups";
                    try{
                    ResultSet wg = stmt.executeQuery(WritingGroups);

                    //STEP 5: Extract data from result set
                    System.out.printf(displayFormatGroupsAndPublishers, "Group Name", "Head Writer", "Year Formed", "Subject");
                    while (wg.next()) {

                        //Retrieve by column name
                        groupName = wg.getString("GroupName");
                        headWriter = wg.getString("HeadWriter");
                        yearFormed = wg.getInt("YearFormed");
                        subject = wg.getString("Subject");

                    //Display values
                    System.out.printf(displayFormatGroupsAndPublishers, dispNull(groupName), dispNull(headWriter), dispNull(Integer.toString(yearFormed)), dispNull(subject));
                    }

                    //STEP 6: Clean-up environment
                    System.out.println("\n");
                    wg.close();
                    }
                    catch(SQLException e){
                        e.getMessage();
                    }
                    break;

                // List Writing Groups specified by the user
                case 2:
                    //STEP 4: Execute a query
                    System.out.println("Creating statement...");
                    menuChoice = menu(2);

                    switch(menuChoice) {
                        case(1):
                            pstmt = conn.prepareStatement(
                            "SELECT GroupName, HeadWriter, YearFormed, Subject FROM WritingGroups WHERE GROUPNAME=?");
                            System.out.println("Please enter a group name: ");
                            userChoice = in.nextLine();
                            break;
                        case(2):
                            pstmt = conn.prepareStatement(
                            "SELECT GroupName, HeadWriter, YearFormed, Subject FROM WritingGroups WHERE HEADWRITER=?");
                            System.out.println("Please enter a head writer: ");
                            userChoice = in.nextLine();
                            break;
                        case(3):
                            pstmt = conn.prepareStatement(
                            "SELECT GroupName, HeadWriter, YearFormed, Subject FROM WritingGroups WHERE YEARFORMED=?");
                            System.out.println("Please enter a year formed: ");
                            userChoice = in.nextLine();
                            break;
                        case(4):
                            pstmt = conn.prepareStatement(
                            "SELECT GroupName, HeadWriter, YearFormed, Subject FROM WritingGroups WHERE SUBJECT=?");
                            System.out.println("Please enter a subject: ");
                            userChoice = in.nextLine();
                            break;
                    }
                    try{
                        pstmt.setString(1, userChoice);
                        ResultSet g = pstmt.executeQuery();

                        //STEP 5: Extract data from result set
                        System.out.printf(displayFormatGroupsAndPublishers, "Group Name", "Head Writer", "Year Formed", "Subject");

                        while (g.next()) {
                            //Retrieve by column name
                            groupName = g.getString(1);
                            headWriter = g.getString(2);
                            yearFormed = g.getInt(3);
                            subject = g.getString(4);

                            //Display values
                            System.out.printf(displayFormatGroupsAndPublishers,
                            dispNull(groupName), dispNull(headWriter), dispNull(Integer.toString(yearFormed)), dispNull(subject));
                        }
                        System.out.println("\n");

                        //STEP 6: Clean-up environment
                        g.close();
                    }
                    catch(SQLException e){
                        System.out.println(e.getMessage());
                    }
                    break;

                //~~Number 3: List all publishers~~
                case 3: 
                    //STEP 4: Execute a query
                    System.out.println("Creating statement...");
                    stmt = conn.createStatement();
                    String Publisher = "SELECT PublisherName, PublisherAddress, PublisherPhone, PublisherEmail FROM Publishers";
                    try{
                        ResultSet p = stmt.executeQuery(Publisher);

                        //STEP 5: Extract data from result set
                        System.out.printf(displayFormatGroupsAndPublishers, "Publisher Name", "Year Publisher Address", "Publisher Phone", "Publisher Email");
                        while (p.next()) {
                            //Retrieve by column name
                            publisherName = p.getString("PublisherName");
                            publisherAddress = p.getString("PublisherAddress");
                            publisherPhone = p.getString("PublisherPhone");
                            publisherEmail = p.getString("PublisherEmail");

                        //Display values
                        System.out.printf(displayFormatGroupsAndPublishers, dispNull(publisherName), dispNull(publisherAddress), dispNull(publisherPhone), dispNull(publisherEmail));
                        }

                        //STEP 6: Clean-up environment
                        System.out.println("\n");
                        p.close();
                    }
                    catch(SQLException e){
                        System.out.println(e.getMessage());
                    }
                    break;

                //~~ Number 4: List all the data for a publisher specified by the user~~
                case 4:
                    //STEP 4: Execute a query
                    System.out.println("Creating statement...");
                    menuChoice = menu(3);

                    switch(menuChoice) {

                        case(1):
                            pstmt = conn.prepareStatement(
                                "SELECT PublisherName, PublisherAddress, PublisherPhone, PublisherEmail FROM PUBLISHERS WHERE PUBLISHERNAME=?");
                            System.out.println("Please enter a publisher name: ");
                            userChoice = in.nextLine();
                            break;
                        case(2):
                            pstmt = conn.prepareStatement(
                                "SELECT PublisherName, PublisherAddress, PublisherPhone, PublisherEmail FROM PUBLISHERS WHERE PUBLISHERADDRESS=?");
                            System.out.println("Please enter a publisher address: ");
                            userChoice = in.nextLine();
                            break;
                        case(3):
                            pstmt = conn.prepareStatement(
                                "SELECT PublisherName, PublisherAddress, PublisherPhone, PublisherEmail FROM PUBLISHERS WHERE PUBLISHERPHONE=?");
                            System.out.println("Please enter a publisher phone number: ");
                            userChoice = in.nextLine();
                            break;
                        case(4):
                            pstmt = conn.prepareStatement(
                                "SELECT PublisherName, PublisherAddress, PublisherPhone, PublisherEmail FROM PUBLISHERS WHERE PUBLISHEREMAIL=?");
                            System.out.println("Please enter a publisher email: ");
                            userChoice = in.nextLine();
                            break;
                        }
                        try{
                            pstmt.setString(1, userChoice);
                            ResultSet pm = pstmt.executeQuery();

                            //STEP 5: Extract data from result set
                            System.out.printf(displayFormatGroupsAndPublishers, "Publisher Name", "Publisher Address", "Publisher Phone", "Publisher Email");
                            while (pm.next()) {
                                //Retrieve by column name
                                publisherName = pm.getString(1);
                                publisherAddress = pm.getString(2);
                                publisherPhone = pm.getString(3);
                                publisherEmail = pm.getString(4);

                                //Display values
                                System.out.printf(displayFormatGroupsAndPublishers,
                                    dispNull(publisherName), dispNull(publisherAddress), dispNull(publisherPhone), dispNull(publisherEmail));
                            }
                            System.out.println("\n");

                            //STEP 6: Clean-up environment
                            pm.close();
                        }
                        catch(SQLException e){
                            System.out.println(e.getMessage());
                        }
                        break;

                //~~Number 5: List all book titles~~    
                case 5:
                    //STEP 4: Execute a query
                    System.out.println("Creating statement...");
                    stmt = conn.createStatement();
                    String Books = "SELECT groupName, publisherName, bookTitle, yearPublished, numberPages FROM Books";
                    try{
                        ResultSet b = stmt.executeQuery(Books);

                        //STEP 5: Extract data from result set
                        System.out.printf(displayFormatBooks, "Group Name", "Publisher Name", "Book Title", "Year Published", "Number of Pages");
                        while (b.next()) {
                            //Retrieve by column name
                            groupName = b.getString("groupName");
                            publisherName = b.getString("publisherName");
                            bookTitle = b.getString("bookTitle");
                            yearPublished = b.getInt("yearPublished");
                            numberPages = b.getInt("numberPages");

                            //Display values
                            System.out.printf(displayFormatBooks, dispNull(groupName), dispNull(publisherName), dispNull(bookTitle), dispNull(Integer.toString(yearPublished)), dispNull(Integer.toString(numberPages)));
                        }

                        //STEP 6: Clean-up environment
                        System.out.println("\n");
                        b.close();
                    }
                    catch(SQLException e){
                        System.out.println(e.getMessage());
                    }
                    break;

                //~~ Number 6: List all the data for a book specified by the user~~
                case 6:
                    //STEP 4: Execute a query
                    System.out.println("Creating statement...");
                    menuChoice = menu(4);

                    switch(menuChoice) {
                        case(1):
                            pstmt = conn.prepareStatement(
                                "SELECT GroupName, PublisherName, BookTitle, YearPublished, NumberPages FROM BOOKS WHERE GROUPNAME=?");
                            System.out.println("Please enter a group name: ");
                            userChoice = in.nextLine();
                            break;
                        case(2):
                            pstmt = conn.prepareStatement(
                                "SELECT GroupName, PublisherName, BookTitle, YearPublished, NumberPages FROM BOOKS WHERE PUBLISHERNAME=?");
                            System.out.println("Please enter a publisher name: ");
                            userChoice = in.nextLine();
                            break;
                        case(3):
                            pstmt = conn.prepareStatement(
                                "SELECT GroupName, PublisherName, BookTitle, YearPublished, NumberPages FROM BOOKS WHERE BOOKTITLE=?");
                            System.out.println("Please enter a book title: ");
                            userChoice = in.nextLine();
                            break;
                        case(4):
                            pstmt = conn.prepareStatement(
                                "SELECT GroupName, PublisherName, BookTitle, YearPublished, NumberPages FROM BOOKS WHERE YEARPUBLISHED=?");
                            System.out.println("Please enter a year published: ");
                            userChoice = in.nextLine();
                            break;
                        case(5):
                            pstmt = conn.prepareStatement(
                                "SELECT GroupName, PublisherName, BookTitle, YearPublished, NumberPages FROM BOOKS WHERE NUMBERPAGES=?");
                            System.out.println("Please enter the number of pages: ");
                            userChoice = in.nextLine();
                            break;
                    }
                    pstmt.setString(1, userChoice);
                    try{
                        ResultSet bm = pstmt.executeQuery();

                        //STEP 5: Extract data from result set
                        System.out.printf(displayFormatBooks, "Group Name", "Publisher Name", "Book Title", "Year Published", "Number of Pages");
                        while (bm.next()) {
                            //Retrieve by column name
                            groupName = bm.getString(1);
                            publisherName = bm.getString(2);
                            bookTitle = bm.getString(3);
                            yearPublished = bm.getInt(4);
                            numberPages = bm.getInt(5);

                            //Display values
                            System.out.printf(displayFormatBooks,
                                dispNull(groupName), dispNull(publisherName), dispNull(bookTitle), dispNull(Integer.toString(yearPublished)), dispNull(Integer.toString(numberPages)));
                        }
                        //System.out.println("\n");

                        //STEP 6: Clean-up environment
                        bm.close();
                    }
                    catch(SQLException e){
                        System.out.println(e.getMessage());
                    }
                    break;

                //~~ Number 7: Insert a new book
                case(7):
                    stmt = conn.createStatement();
                    System.out.println("Enter group name of the book to add (limit 30 characters)");
                    groupName = in.nextLine();
                    
                    while(groupName.isEmpty()){
                       System.out.println("Value cannot be blank. \nProvide the name of the writing group: ");
                       groupName = in.nextLine();
                    }
                    
                    System.out.println("Enter publisher name of the book (limit 50 characters)");
                    publisherName = in.nextLine();
                    
                    while(publisherName.isEmpty()){
                        System.out.println("Value cannot be blank. \nProvide the name of the publisher: ");
                        publisherName = in.nextLine();
                    }
                    
                    System.out.println("Enter book title of the book to add (limit 30 characters)");
                    bookTitle = in.nextLine();

                    while(bookTitle.isEmpty()){
                        System.out.println("Value cannot be blank. \nprovide the name of the book title: ");
                        bookTitle = in.nextLine();
                    }
                    
                    System.out.println("Enter the published year of the book (integer ex: 2000.. XXXX)");
                    yearPublished = in.nextInt();
                    
                    System.out.println("Enter the number of pages of the book (integer)");
                    numberPages = in.nextInt();
                    in.nextLine();
                    
                    System.out.println("Creating statement... ");
                    try{
                        pstmt = conn.prepareStatement("INSERT INTO Books(groupName, publisherName, bookTitle, yearPublished, numberPages) VALUES(?,?,?,?,?)");
                        pstmt.setString(1, groupName);
                        pstmt.setString(2, publisherName);
                        pstmt.setString(3, bookTitle);
                        pstmt.setInt(4, yearPublished);
                        pstmt.setInt(5, numberPages);

                        pstmt.executeUpdate();
                    }
                    catch(SQLException e){
                        System.out.println(e.getMessage());
                    }
                    break;

                //~~ Number 8: Insert a new publisher and update all books published by one publisher to be published by the new publisher
                case(8):
                    stmt = conn.createStatement();
                    System.out.println("Enter the name of the publisher to add (limit 30 characters)");
                    publisherName = in.nextLine();
                    
                    while(publisherName.isEmpty()){
                        System.out.println("Publisher name cannot be blank. \nProvide the publisher name:");
                        publisherName = in.nextLine();
                    }
                    System.out.println("Enter the address of the publisher to add (limit 50 characters)");
                    publisherAddress = in.nextLine();
                    
                    while(publisherAddress.isEmpty()){
                        System.out.println("Address cannot be blank. \nProvide the address: ");
                        publisherAddress = in.nextLine();
                    }

                    System.out.println("Enter the phone number of the publisher to add (limit 30 characters)");
                    publisherPhone = in.nextLine();
                    
                    while(publisherPhone.isEmpty()){
                        System.out.println("Phone cannot be blank. \nProvide the phone number: ");
                        publisherPhone = in.nextLine();
                    }

                    System.out.println("Enter the email address of the publisher to add (limit 30 characters)");
                    publisherEmail = in.nextLine();
                    
                    while(publisherEmail.isEmpty()){
                        System.out.println("Email cannot be blank. \nProvide the email: ");
                        publisherEmail = in.nextLine();
                    }

                    System.out.println("Creating statement... ");
                    try{
                        pstmt = conn.prepareStatement("INSERT INTO Publishers(publisherName, publisherAddress, publisherPhone, publisherEmail) VALUES(?,?,?,?)");
                        pstmt.setString(1, publisherName);
                        pstmt.setString(2, publisherAddress);
                        pstmt.setString(3, publisherPhone);
                        pstmt.setString(4, publisherEmail);

                        pstmt.executeUpdate();

                        String update = "UPDATE Books SET publisherName = ? WHERE publisherName = ?";
                        pstmt = conn.prepareStatement(update);

                        pstmt.setString(1, publisherName);

                        System.out.printf("What is the name of the Publisher that %s will replace?", publisherName);
                        String replacedPublisher = in.nextLine();

                        pstmt.setString(2, replacedPublisher);
                        pstmt.executeUpdate();
                    }
                    catch(SQLException e){
                        System.out.println(e.getMessage());
                    }
                    break;

                //~~ Number 9: Remove a book specified by the user
                case (9): 

                    System.out.println("Select a book to delete by providing its' title: ");
                    bookTitle = in.nextLine();

                    System.out.println("Provide the name of that book's corresponding writing group: ");
                    groupName = in.nextLine();

                    while(bookTitle.isEmpty()){
                        System.out.println("Value cannot be blank. \nProvide the title of the book: ");
                        bookTitle = in.nextLine();
                    }

                    while(groupName.isEmpty()){
                        System.out.println("Value cannot be blank. \nProvide the name of the writing group: ");
                        groupName = in.nextLine();
                    }
                    System.out.println("Creating statement... ");
                    try{
                        pstmt = conn.prepareStatement(
                            "DELETE FROM Books WHERE bookTitle = ? AND groupName = ?");
                        pstmt.setString(1, bookTitle);
                        pstmt.setString(2, groupName);
                        pstmt.executeUpdate();

                        System.out.println("Book successfully removed!\n");
                    }
                    catch(SQLException e){
                        System.out.println(e.getMessage());
                    }
                    break;

                case(10):
                    menuChoice = 10;
                    break;
                }
            }
        
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
            }// nothing we can do
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        System.out.println("Goodbye!");
    }//end main
    
    public static int menu(int table) {
        Scanner in = new Scanner(System.in);
        String menuOptions = "Please enter a number for how you want to choose from the";
        switch(table) {
            case(1):
                System.out.println(menuOptions + " menu: ");
                System.out.println("1) List all writing groups \n2) List all the data for a group specified by the user"
                    + "\n3) List all publishers \n4) List all the data for a publisher specified by the user"
                    + "\n5) List all book titles \n6) List all the data for a book specified by the user \n7) Insert a new book"
                    + "\n8) Insert a new publisher and update all books published by one publisher to be published by the new publisher"
                    + "\n9) Remove a book specified by the user \n10)Exit Menu");
                break;
            case(2):
                System.out.println(menuOptions + " writing groups: ");
                System.out.println("1) Group Name \n2) Head Writer \n3) Year Formed \n4) Subject");
                break;
            case(3):
                System.out.println(menuOptions + " publishers: ");
                System.out.println("1) Publisher Name \n2) Publisher Address \n3) Publisher Phone \n4) Publisher Email");
                break;
            case(4):
                System.out.println(menuOptions + " books: ");
                System.out.println("1) Group Name \n2) Publisher Name \n3) Book Title \n4) Year Published \n5) Number of Pages");
                break;
        }
        return in.nextInt();
    }
}
