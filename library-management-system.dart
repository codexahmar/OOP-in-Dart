import 'dart:io';

void main() {
  Library library = Library();
  bool continueProgram = true;

  while (continueProgram) {
    print("Menu:");
    print("1. Add Book");
    print("2. Display Books");
    print("3. Loan Book");
    print("4. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        library.addBook();
        print("--------------");
        break;
      case '2':
        library.displayBooks();
        print("--------------");
        break;
      case '3':
        library.loanBook();
        print("--------------");
        break;
      case '4':
        continueProgram = false;
        print("Exited");
        print("--------------");
        break;
      default:
        print("Invalid choice. Please try again.");
        print("--------------");
    }
  }
}

class Library {
  List<Book> books = [];
  List<MemberLoanManager> loanManagers = [];

  void addBook() {
    stdout.write("Enter the Title of the book: ");
    String? title = stdin.readLineSync();
    if (title == null || title.isEmpty) {
      print("Title cannot be empty.");
      return;
    }

    stdout.write("Enter the name of the author: ");
    String? author = stdin.readLineSync();
    if (author == null || author.isEmpty) {
      print("Author name cannot be empty.");
      return;
    }

    stdout.write("Enter the ISBN of the book: ");
    String? isbn = stdin.readLineSync();
    if (isbn == null || isbn.isEmpty) {
      print("ISBN cannot be empty.");
      return;
    }

    // Check if book with same ISBN already exists
    if (books.any((book) => book.isbn == isbn)) {
      print("Book with ISBN '$isbn' already exists in the library.");
      return;
    }

    bool isAvailable = true;
    Book book = Book(title, author, isbn, isAvailable);
    books.add(book);
    print("Book added successfully.");
  }

  void loanBook() {
    if (books.isEmpty) {
      print("No books in the library to loan.");
      return;
    }

    displayBooks();

    stdout.write("Enter the Title of the book to loan: ");
    String? title = stdin.readLineSync();
    if (title == null || title.isEmpty) {
      print("Title cannot be empty.");
      return;
    }

    Book? bookToLoan = findBookByTitle(title);

    if (bookToLoan == null) {
      print("Book with title '$title' not found.");
      return;
    }

    if (!bookToLoan.isAvailable) {
      print("Book '$title' is already on loan.");
      return;
    }

    stdout.write("Enter the name of the member: ");
    String? memberName = stdin.readLineSync();
    if (memberName == null || memberName.isEmpty) {
      print("Member name cannot be empty.");
      return;
    }

    stdout.write("Enter the member ID: ");
    String? memberId = stdin.readLineSync();
    if (memberId == null || memberId.isEmpty) {
      print("Member ID cannot be empty.");
      return;
    }

    // Check if member has already loaned a book
    if (loanManagers.any((manager) => manager.member.name == memberName)) {
      print("Member '$memberName' has already loaned a book.");
      return;
    }

    Member member = Member(memberName, memberId);
    DateTime loanDate = DateTime.now();
    DateTime returnDate =
        loanDate.add(Duration(days: 14)); 
    Loan loan = Loan(member, bookToLoan, loanDate, returnDate);
    bookToLoan.isAvailable = false; 

    // Add loan manager for this member
    loanManagers.add(MemberLoanManager(member, loan));

    print(
        "Book '${bookToLoan.title}' has been loaned to ${member.name} (${member.memberId}).");
  }

  void displayBooks() {
    if (books.isEmpty) {
      print("No books in the library.");
    } else {
      print("Books in the library:");
      for (var book in books) {
        print(
            "Title: ${book.title}, Author: ${book.author}, ISBN: ${book.isbn}, Availability Status: ${book.isAvailable}");
      }
      print("--------------");
    }
  }

  Book? findBookByTitle(String title) {
    for (var book in books) {
      if (book.title.toLowerCase() == title.toLowerCase()) {
        return book;
      }
    }
    return null;
  }
}

class Book {
  String title;
  String author;
  String isbn;
  bool isAvailable;

  Book(this.title, this.author, this.isbn, this.isAvailable);
}

class Member {
  String name;
  String memberId;

  Member(this.name, this.memberId);
}

class Loan {
  Member member;
  Book book;
  DateTime loanDate;
  DateTime returnDate;

  Loan(this.member, this.book, this.loanDate, this.returnDate);
}

class MemberLoanManager {
  Member member;
  Loan loan;

  MemberLoanManager(this.member, this.loan);
}
