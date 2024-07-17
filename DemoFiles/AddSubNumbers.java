import java.util.Scanner;

public class AddSubNumbers {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    // Get user input for the numbers
    System.out.print("Enter the first number: ");
    double num1 = scanner.nextDouble();

    System.out.print("Enter the second number: ");
    double num2 = scanner.nextDouble();

    // Perform addition and subtraction
    double sum = num1 + num2;
    double difference = num1 - num2;

    // Print the results
    System.out.println("The sum of " + num1 + " and " + num2 + " is " + sum);
    System.out.println("The difference of " + num1 + " and " + num2 + " is " + difference);

    scanner.close();
  }
}