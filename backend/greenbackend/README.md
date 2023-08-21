# NTTGreen Backend

This is the backend for the NTTGreen application for tracking carbon omissions.

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Requirements](#requirements)
- [Setup and Installation](#setup-and-installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [API Documentation](#api-documentation)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Description

This is the backend for the NTTGreen application for tracking the carbon omission from a questionnaire.It is build using the django framework.

## Features

This application is build using the django rest framework. It handles the authentication of the frontend application, stores the question bank and saves the responses of each users .

## Requirements

These are the prerequisites and requirements needed to set up and run your Django backend application. This can include:

- Python version ~ 3.11.2
- Django version ~ 4.2.4
- Required Python packages (installable via `requirements.txt`)
- Database (e.g., PostgreSQL, MySQL, by default SQLite) - no installation required
- Any other dependencies

## Setup and Installation

Provide step-by-step instructions on how to set up and install your Django backend application. Include any environment variables that need to be configured, database setup, and other necessary setup tasks.

```
# Navigate to the project directory
cd carbapp/backend/greenbackend

# Create a virtual environment
python -m venv env

# Activate virtual environment
env\Scripts\activate.bat

# Install dependencies
pip install -r requirements.txt

# Perform database migrations
python manage.py migrate
```


# Configuration
You can create an admin user using the below command
```
python manage.py createsuperuser
```
View admin panel at http://ip-address:8000/admin

## Usage
To run the server use the following command - 

```
# Run the development server
python manage.py runserver
```

## API Documentation
### Base URL
The base url for accessing the API endpoints is 'https://your-ip-address:8000'
### Endpoints
| Category | API                     | URL                 | Protocol | Remark                                                                                                                                                                                    |
| -------- | ----------------------- | ------------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| User     | User Sign Up            | /user/signup/      | POST     | Parameters:\* user_name<br>\* password<br>\* email<br>\* mobile<br>\* gender<br>\* date_of_birth<br><br>Response:<br>\* id<br>\* user_name<br>\* email<br>\* token<br>\* token_expires_at |
| User     | User Sign In            | /user/signin/      | POST     | Parameters:<br>\* password<br>\* email<br><br>Response:<br>\* id<br>\* username<br>\* email<br>\* token                                                                                   |
| User     | Check User Login Status | /user/check-login/ | GET      | Header<br>\* Authorization: token<br><br>Parameters:<br>\* none<br><br>Response:<br>\* id<br>\* username<br>\* email<br>\* token                                                          |


## Contributing
Contributing members to the project
- Ben Boby
- Taranpreet Singh
- Rahul Majuker
- Lalit Tirole
- Yash Kulkarni

## License
This code is protected under NTT DATA IP Protection Licenses.

## Contact
You can reach me at ben.boby@nttdata.com