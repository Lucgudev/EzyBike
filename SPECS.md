
## What to build

A customer app for electric bike with feature to see list of bike and option to rent the bike:  
**SignUp page**  
This page consist of form, Email and Password form, also button, the button is enabled when the validation is valid, also there will be a button for sign up that lead to SignUp Page

**SignIn page**  
This page consist of form Email, Password and Re-Type Password and also button with Text Register. The button is enabled when the validation is valid.

**Home page**
Home page is consist of List with segment
First segment is profile
Second segment is promotional Banner
Third segment is Rental Packages (plan, price/day-week-month, terms)
Fourth segment is List of Bikes (model, photo, range, availability)

**Bike Detail page**
Show Bike Detail and there will be button "I'm interested to Rent"

**Rent Bike Form Page**
Show form to rent the electric Bike consist of start date, pickup area (it defined, user just need to choose pickup points), phone contact

## Tech constraints
Use Clean Architecture, seperate into Data, Domain, Presentation.   
Use MVVM Pattern like usual and use Riverpod.

## Must-haves
```  
Compiles and runs on at least one mobile target and/or Web.  
Clean project structure with a clear separation of concerns.  
Sensible error handling and basic caching/memoization where it adds  
value.  
Simple filter on bike list.  
Thoughtful README.  
```