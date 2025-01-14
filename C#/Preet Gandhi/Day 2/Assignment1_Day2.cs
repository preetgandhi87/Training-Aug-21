﻿////Create a reference type called Person.  Populate the Person class with the following properties to store the following information:

////First name
////Last name
////Email address
////Date of birth
////Add constructors that accept the following parameter lists:


////1.All four parameters

////2. First, Last, Email

////3. First, Last, Date of birth

////Add read-only properties that return the following computed information:


////1.Adult – whether or not the person is over 18

////2. Sun sign – the traditional western sun sign of this person

////3. Chinese sign – the chinese astrological sign (animal) of this person

////4. Birthday – whether or not today is the person’s birthday

////5. Screen name – a default screen name that you might see being offered to a first time user of AOL or Yahoo (e.g.John Doe born on Feburary 25th, 1980 might be jdoe225 or johndoe022580)

////Access these things from Console Application in the Main Function. Accept this data for 5 person and display the same. Means create an object Array of 5 size and accept these details and display these details in tabular format.


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment1_Day2
{
    class Person
    {
        string FirstName;
        string LastName;
        string EmailAddress;
        DateTime DateOfBirth;

        public Person(string FirstName, string LastName, string EmailAddress, DateTime DateOfBirth)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.EmailAddress = EmailAddress;
            this.DateOfBirth = DateOfBirth;
        }
        public Person(string FirstName, string LastName, string EmailAddress)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.EmailAddress = EmailAddress;
        }
        public Person(string FirstName, string LastName, DateTime DateOfBirth)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.DateOfBirth = DateOfBirth;
        }

        public string Adult
        {
            get
            {
                TimeSpan ts = DateTime.Now.Subtract(DateOfBirth);
                int age = ts.Days / 365;
                if (age > 18)
                {
                    return "You are Adult";
                }
                else
                {
                    return "You are not an adult";
                }
            }
        }

        public string SunSign
        {
            get
            {
                if ((this.DateOfBirth.Day >= 21 && this.DateOfBirth.Month == 03) || (this.DateOfBirth.Day <= 19 && this.DateOfBirth.Month == 04))
                {
                    return "Your SunSign is 'Aries'";
                }
                else if ((this.DateOfBirth.Day >= 20 && this.DateOfBirth.Month == 04) || (this.DateOfBirth.Day <= 20 && this.DateOfBirth.Month == 05))
                {
                    return "Your SunSign is 'Taurus'";
                }
                else if ((this.DateOfBirth.Day >= 21 && this.DateOfBirth.Month == 05) || (this.DateOfBirth.Day <= 20 && this.DateOfBirth.Month == 06))
                {
                    return "Your SunSign is 'Gemini'";
                }
                else if ((this.DateOfBirth.Day >= 21 && this.DateOfBirth.Month == 06) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 07))
                {
                    return "Your SunSign is 'Cancer'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 07) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 08))
                {
                    return "Your SunSign is 'Leo'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 08) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 09))
                {
                    return "Your SunSign is 'Virgo'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 09) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 10))
                {
                    return "Your SunSign is 'Libra'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 10) || (this.DateOfBirth.Day <= 21 && this.DateOfBirth.Month == 11))
                {
                    return "Your SunSign is 'Scorpio'";
                }
                else if ((this.DateOfBirth.Day >= 22 && this.DateOfBirth.Month == 11) || (this.DateOfBirth.Day <= 21 && this.DateOfBirth.Month == 12))
                {
                    return "Your SunSign is 'Sagittarius'";
                }
                else if ((this.DateOfBirth.Day >= 22 && this.DateOfBirth.Month == 12) || (this.DateOfBirth.Day <= 19 && this.DateOfBirth.Month == 01))
                {
                    return "Your SunSign is 'Capricorn'";
                }
                else if ((this.DateOfBirth.Day >= 20 && this.DateOfBirth.Month == 01) || (this.DateOfBirth.Day <= 18 && this.DateOfBirth.Month == 02))
                {
                    return "Your SunSign is 'Aquarius'";
                }
                else
                {
                    return "Your SunSign is 'Pisces'";
                }
            }
        }

        public string ChineseSign
        {
            get
            {
                if ((this.DateOfBirth.Day >= 21 && this.DateOfBirth.Month == 03) || (this.DateOfBirth.Day <= 19 && this.DateOfBirth.Month == 04))
                {
                    return "Your ChineseSign is 'Dragon'";
                }
                else if ((this.DateOfBirth.Day >= 20 && this.DateOfBirth.Month == 04) || (this.DateOfBirth.Day <= 20 && this.DateOfBirth.Month == 05))
                {
                    return "Your ChineseSign is 'Snake'";
                }
                else if ((this.DateOfBirth.Day >= 21 && this.DateOfBirth.Month == 05) || (this.DateOfBirth.Day <= 20 && this.DateOfBirth.Month == 06))
                {
                    return "Your ChineseSign is 'Horse'";
                }
                else if ((this.DateOfBirth.Day >= 21 && this.DateOfBirth.Month == 06) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 07))
                {
                    return "Your ChineseSign is 'Sheep'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 07) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 08))
                {
                    return "Your ChineseSign is 'Monkey'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 08) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 09))
                {
                    return "Your ChineseSign is 'Rooster'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 09) || (this.DateOfBirth.Day <= 22 && this.DateOfBirth.Month == 10))
                {
                    return "Your ChineseSign is 'Dog'";
                }
                else if ((this.DateOfBirth.Day >= 23 && this.DateOfBirth.Month == 10) || (this.DateOfBirth.Day <= 21 && this.DateOfBirth.Month == 11))
                {
                    return "Your ChineseSign is 'Pig'";
                }
                else if ((this.DateOfBirth.Day >= 22 && this.DateOfBirth.Month == 11) || (this.DateOfBirth.Day <= 21 && this.DateOfBirth.Month == 12))
                {
                    return "Your ChineseSign is 'Rat'";
                }
                else if ((this.DateOfBirth.Day >= 22 && this.DateOfBirth.Month == 12) || (this.DateOfBirth.Day <= 19 && this.DateOfBirth.Month == 01))
                {
                    return "Your ChineseSign is 'Ox'";
                }
                else if ((this.DateOfBirth.Day >= 20 && this.DateOfBirth.Month == 01) || (this.DateOfBirth.Day <= 18 && this.DateOfBirth.Month == 02))
                {
                    return "Your ChineseSign is 'Tiger'";
                }
                else
                {
                    return "Your ChineseSign is 'Rabbit'";
                }
            }
        }


        public string BirthDay
        {
            get
            {
                if ((DateTime.Now.Day == this.DateOfBirth.Day) && (DateTime.Now.Month == this.DateOfBirth.Month))
                {
                    return "Today Is Your Birthday";
                }
                else
                {
                    return "Today is not your Birthday";
                }
            }
        }
        public string ScreenName
        {
            get
            {
                string showName = ("ScreenName is: " + this.FirstName.ToLower() + this.LastName.ToLower() + DateOfBirth.Day + DateOfBirth.Month + DateOfBirth.Year);
                return showName;
            }
        }

        public void display()
        {
            Console.WriteLine("++++++++++++++++++++++++++++++++");
            Console.WriteLine(Adult);
            Console.WriteLine(SunSign);
            Console.WriteLine(ChineseSign);
            Console.WriteLine(BirthDay);
            Console.WriteLine(ScreenName);
            Console.WriteLine("--------------------------------");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            string FirstName;
            string LastName;
            string EmailAddress;
            DateTime DateOfBirth;
            Person[] p = new Person[2];
            for (int i = 0; i < p.Length; i++)
            {
                Console.Write($"Enter FirstName of Person{i + 1}: ");
                FirstName = Console.ReadLine();
                Console.Write($"Enter LastName of Person{i + 1}: ");
                LastName = Console.ReadLine();
                Console.Write($"Enter EmailAddress of Person{i + 1}: ");
                EmailAddress = Console.ReadLine();
                Console.Write($"Enter DateOfBirth of Person{i + 1}: ");
                DateOfBirth = Convert.ToDateTime(Console.ReadLine());
                Console.WriteLine("-----------------------------------");
                p[i] = new Person(FirstName, LastName, EmailAddress, DateOfBirth);
            }
            for (int i = 0; i < p.Length; i++)
            {
                p[i].display();
            }
            Console.ReadLine();
        }
    }
}