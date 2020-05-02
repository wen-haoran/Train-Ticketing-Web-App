# CS336Trains
## Group 2 

Training Ticketing Web App
ReadME.txt FILE

Introduction: Chubba Chugga Trains is a functional and stylish online railway booking system supported by a relational database system. We used HTML/CSS for the user interface, MySQL for the database server, and Java,  Javascript, and JDBC for connectivity between the user interface and database server. Thank you for checking out our project, and don’t forget to Choo Choo With Us!

Overview: 
  Web App functionalities for Customers of Chubba Chugga Trains
      Browse Different Train Schedules
      Reserve Tickets for searched schedules
      View all past and current reservations
      Ask/Search Questions
      Browse through Q&A Page
3 Different Types of Accounts:
  Customer  
      User can create customer account on Registration Page OR
      Admin can create Customer account
  Admim
      username: admin
      password: admin
  Customer Representative
      Sample account
          Username: 1
          Password: 1
          
Admin can create Customer Rep. account 
URL: http://ec2-3-21-92-127.us-east-2.compute.amazonaws.com:8080/TrainProject
Amazon EC2 and Apache Tomcat credentials  
.psm file
Username: cs336u Password: cs336pn



Graded Individually CheckList

Create Account for users, login, logout & Database Creation- Shared ♪(´ε｀ ) 

Browsing and Search Functions- Mandi Leong ヾ(๑╹◡╹)ﾉ" 
    registerPage.jsp - registers customers
    registerLogic.jsp - inserts customer info into database
    browse.jsp - searches train schedules based on origin/destination and date
    browseLogic.jsp - queries database based on user input
    repIndex.jsp -home page for customer reps
    Created a train system with schedules and inserted into the database for testing (see bottom)

Reservation Functions - Haoran Wen (*☻-☻*)
    makeReservation.jsp: Interface for the user to input reservation info when making a reservation
    reservationLogic.jsp: Code connects with part 2 and connect with the data inputted from makeReservation
    Get discount if disabled/children/elderly
    Round trip or one way trip
    Net Reservation Cost
    viewReservation.jsp: Displays reservation for the user that's logged in. 
    View current and pass reservation with their details 
    deleteReservation.jsp: cancel/delete specified reservation
    loginPage.jsp: customer login landing page where user inputs login information.
    loginLogic.jsp: backend code that checks user input constraints and logs in the customer. 

Messaging Functions/CSS - Ashleigh Chung ٩(˃̶͈̀௰˂̶͈́)و
    Every File under “zCss” Folder
        All CSS (Customer’s view of the app only)
        The names of all CSS files are identical to the jsp file they are applied to
    Every File under “zQuestion” Folder
        searchQuestion.jsp - enter keyword to search for
        sendQuestion.jsp - enter question to send to Q&A page
        sendQuestionLogic.jsp - adds question to database
        viewQuestion.jsp - brings up Q&A page
        viewSearchedQuestions.jsp - displayed all searched questions/answers
    In the files below, I added a chunk of code at the very bottom that checks if there is a need to display a “Delay Alert”  every time the use refreshes that page
        index.jsp
        viewReservation.jsp
        browse.jsp
        browseLogic.jsp
        viewQuestion.jsp
        viewSearchedQuestion.jsp 
        sendQuestion.jsp 
	
Admin - Jason Cheng =] 
    activeLInes.jsp - 5 most active lines
    admin.jsp - admin landing page
    adminBestCustomer.jsp - best customer
    adminMonthlyReport.jsp - sales report for a particular month
    adminRevenueReport.jsp - produce a listing of revenue
    deleteCustomer.jsp - delete customer
    deleteEmployee.jsp - delete employee
    editCustomer.jsp - edit customer
    editCustomer2.jsp - edit customer
    editEmployee.jsp - edit employee
    editEmployee2.jsp - edit employee
    produceCustomerResvList.jsp - reservations by customer name
    produceTrainResvList.jsp - reservations by transit line and train number
    registerCustomer.jsp - register customer
    registerEmployee.jsp - register customer

Customer Rep - Charles Xiong (｡ì _ í｡)
    repAddSched.jsp - page for adding schedule
    repAddSchedLogic.jsp - gets user input
    repAddSchedInsert.jsp - inserts into database
    repAnswerQuestion.jsp - page for answering questions
    repAnswerQuestionLogic.jsp
    repAnswerQuestionLogic2.jsp
    repDeleteSched.jsp -deletes schedule from database
    repEditSched.jsp - page for editing schedule
    repEditSchedLogic.jsp - gets user input
    repEditSchedInsert.jsp - inserts into database
    repReserveCustomer.jsp  - page for viewing customers
    repReserveCustomerList.jsp - displays customers
    repSchedByStation.jsp - displays schedules by station
    repSchedByStationLogic.jsp
    repSchedByOD.jsp - displays schedules by origin/destination
    repSchedByODLogic.jsp
    reserveAdd.jsp
    reserveAddLogic.jsp
    reserveAdmin.jsp
    reserveAdminDelete.jsp
    reserveAdminEdit.jsp
    reserveAdminShow.jsp
    reserveEdit.jsp
    trainAdmin.jsp
    trainAdminDelete.jsp
    trainAdminShow.jsp
