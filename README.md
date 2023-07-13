# FixFinder - Technician-Customer Web Application

FixFinder is a web application designed to connect technicians with customers, providing a streamlined platform for finding and booking reliable technician services. This README provides an in-depth explanation of how the application works, including its key features, installation instructions, and usage guidelines.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features
- **Technician Search**: Customers can search for qualified technicians based on location, expertise, and ratings. Detailed technician profiles provide information on experience, availability, and reviews, assisting customers in making informed decisions.

- **Repair Orders**: Technicians can get orders from multiple customers for product repairs.

- **User Authentication**: Secure user authentication is implemented to ensure only authorized users can access the system. Passwords are securely stored and verified.

- **Rating and Reviews**: Customers can rate technicians and leave reviews based on their experiences. This feature promotes trust and transparency within the platform.

- **Admin Dashboard**: An administrative dashboard is available to manage users, technicians, and monitor system activities. It provides functionalities for user and technician verification, content moderation, and generating reports.

## Installation
### Pre-Requisites
1. [Python](https://www.python.org/downloads/)
2. [Django](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj3qOjd4IuAAxXiQ0EAHUJADVUQFnoECBcQAQ&url=https%3A%2F%2Fdocs.djangoproject.com%2Fen%2F4.2%2Ftopics%2Finstall%2F&usg=AOvVaw1qEQ6UM0hycn1frbGP1Qr8&opi=89978449)
3. [MySQL](https://dev.mysql.com/downloads/installer/)
4. [Flutter Version 3.0 or higher](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiDvI-R4YuAAxWGWUEAHYXoCAcQFnoECB4QAQ&url=https%3A%2F%2Fdocs.flutter.dev%2Fget-started%2Finstall&usg=AOvVaw0_DysGRxe6bHMb0c8Whvun&opi=89978449)

### Instructions
1. Clone the repository: `git clone https://github.com/Arnie1x/fixconnect.git`
2. Create a Django Virtual Environment for a local server `virtualenv env`
3. Install the necessary Django dependencies: `pip install -r requirements.txt`
4. run `flutter clean` and `flutter fix` in order to set up Flutter and Dart properly in case of any errors. This ensures project compatibility with your project and flutter
5. Set up the database and configure the connection details in the application's configuration file `.env`.
6. Start the Django server: `python manage.py runserver`
7. Check the `api.dart` file and ensure the Django server's URL matches the one that is on your terminal
8. Run the Flutter Project and pick the browser you will use e.g. Chrome, Firefox `flutter run -d chrome`
9. Access the application in your web browser at `http://localhost:3000`.

## Usage
1. Register as a customer or technician through the provided registration form.
2. Use the search functionality to find qualified technicians based on your location, expertise requirements, and ratings.
3. View technician profiles to gather detailed information, including experience, availability, and customer reviews.
4. Chat with a technician and agree on a good rate for your device fix
5. Technicians can accept or propose alternative offers and also initiate an order once you come to an agreement.
6. Track the status of your appointments and receive notifications throughout the service process.
7. After the service is completed, customers can rate the technician and leave a review to provide feedback.

## Contributing
We welcome contributions from the community! If you'd like to contribute to FixFinder, please follow our [Contribution Guidelines](CONTRIBUTING.md) for details on how to get started.

## License
FixFinder is released under the [MIT License](LICENSE). Feel free to use, modify, and distribute this project as per the terms of the license.

---

We hope this documentation provides a comprehensive understanding of the FixFinder web application.
